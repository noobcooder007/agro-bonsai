import 'package:agro_bonsai/domain/entities/auth.dart';
import 'package:agro_bonsai/infrastructure/models/auth_response.dart';

class AuthMapper {
  static Auth authResponseToAuthEntity(AuthResponse authResponse) =>
      Auth(ok: authResponse.ok, token: authResponse.token);
}
