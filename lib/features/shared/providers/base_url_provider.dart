import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/api/endpoints.dart';

/// Provides the base URL for the API.
final providerOfBaseUrl = Provider<String>((ref) => kUrlBase);

/// Provides the development base URL for the API.
final providerOfBaseUrlDev = Provider<String>((ref) => kUrlBaseDev);
