import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/services/user_service.dart';

final providerOfUserService = Provider<UserService>(UserService.new);
