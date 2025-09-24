import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final googleAuthServerClientId =
      dotenv.env['GOOGLE_OAUTH_SERVER_CLIENT_ID'] ?? '';
}
