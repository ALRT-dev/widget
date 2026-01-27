import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final googleAuthServerClientId =
      dotenv.env['GOOGLE_OAUTH_SERVER_CLIENT_ID'] ?? '';

  static final googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  static final microsoftClientId = dotenv.env['MICROSOFT_CLIENT_ID'] ?? '';

  static final microsoftTenantId = dotenv.env['MICROSOFT_TENANT_ID'] ?? '';
}
