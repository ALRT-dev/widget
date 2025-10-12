import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/api/interceptors/auth_interceptor.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/providers/dio_instance_provider.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/repositories/shared_prefs_repository.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  SocketService(final Ref ref) : _ref = ref;

  final Ref _ref;
  SharedPreferencesRepository get _sharedPrefRepository =>
      _ref.read(providerOfSharedPreferencesRepository);
  Dio get _dioInstance => _ref.read(providerOfDioInstance(true));

  late Socket _socket;
  var _isSocketConnected = false;

  final _onSocketConnectionChangedStreamController =
      StreamController<bool>.broadcast();

  Socket get socket => _socket;
  bool get isSocketConnected => _isSocketConnected;

  Stream<bool> get onSocketConnectionChanged =>
      _onSocketConnectionChangedStreamController.stream;

  Future<Either<void, AppError>> connect() {
    return runAsyncCall(
      name: 'connectSocket',
      future: () async {
        if (_isSocketConnected) {
          await disconnect();
        }

        final completer = Completer();

        final authInterceptor = AuthInterceptor(
          dio: _dioInstance,
          sharedPreferencesRepository: _sharedPrefRepository,
        );
        final token = await authInterceptor.getAccessToken();
        if (token == null) throw AppError(message: 'No auth token found!');

        final socketUrl = _dioInstance.options.baseUrl.substring(
          0,
          // this will remove "/api" from the base url
          _dioInstance.options.baseUrl.length - 4,
        );

        log('Attempting to connect to socket at: $socketUrl');

        _socket = io(
          socketUrl,
          OptionBuilder()
              .setTransports(['websocket'])
              .setAuth({'token': token})
              .enableForceNew()
              .build(),
        );

        _socket.onConnect((_) {
          log('SOCKET CONNECTED');

          _isSocketConnected = true;
          _onSocketConnectionChangedStreamController.add(true);

          if (!completer.isCompleted) {
            completer.complete();
          }
        });

        _socket.onDisconnect((_) {
          log('SOCKET DISCONNECTED');

          _isSocketConnected = false;
          _onSocketConnectionChangedStreamController.add(false);
        });

        _socket.onError((error) {
          log('SOCKET ERROR: $error');

          _isSocketConnected = false;
          _onSocketConnectionChangedStreamController.add(false);

          if (!completer.isCompleted) {
            completer.completeError(error);
          }
        });

        _socket.onConnectError((error) {
          log('SOCKET CONNECT ERROR: $error');
          log('Verify that Socket.IO server is running on: $socketUrl');

          _isSocketConnected = false;
          _onSocketConnectionChangedStreamController.add(false);

          if (!completer.isCompleted) {
            completer.completeError(
              'Failed to connect to Socket.IO server at $socketUrl. Error: $error',
            );
          }
        });

        _socket.onAnyOutgoing((event, data) {
          log('SOCKET OUTGOING: $event, data: $data');
        });

        _socket.onAny((event, data) {
          log('SOCKET INCOMING: $event, data: $data');
        });

        await completer.future;

        return Success(null);
      },
      onError: Failure.new,
    );
  }

  Future<Either<void, AppError>> disconnect() {
    return runAsyncCall(
      name: 'disconnectSocket',
      future: () async {
        if (_isSocketConnected) _socket.dispose();
        return Success(null);
      },
      onError: Failure.new,
    );
  }

  /// Test method to check if the Socket.IO server is reachable
  Future<Either<void, AppError>> testSocketConnection() {
    return runAsyncCall(
      name: 'testSocketConnection',
      future: () async {
        final socketUrl = _dioInstance.options.baseUrl.substring(
          0,
          _dioInstance.options.baseUrl.length - 4,
        );

        log('Testing Socket.IO connection to: $socketUrl');

        try {
          // Try to make a simple HTTP request to the socket.io endpoint
          final response = await _dioInstance.get('$socketUrl/socket.io/');
          log('Socket.IO endpoint test response: ${response.statusCode}');
          return Success(null);
        } catch (e) {
          log('Socket.IO endpoint test failed: $e');
          throw AppError(
            message:
                'Socket.IO server not reachable at $socketUrl/socket.io/\n'
                'Please check:\n'
                '1. Is your backend server running?\n'
                '2. Is Socket.IO configured correctly?\n'
                '3. Is the correct port (9000) being used?\n'
                'Error: $e',
          );
        }
      },
      onError: Failure.new,
    );
  }
}
