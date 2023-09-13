import 'package:samduapp/domain/api_client/auth_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final userToken = await _sessionDataProvider.tokenUser;
    final isAuth = userToken != null;
    return isAuth;
  }

  Future<void> login(String email, String password) async {
    final user =
        await _accountApiClient.loginUser(email: email, password: password);
    await _sessionDataProvider.setTokenUser(user.token);
    await _sessionDataProvider.setUserId(user.id);
  }

  Future<void> registration(String name, String email, String password) async {
    final user = await _accountApiClient.registrationUser(
      name: name,
      email: email,
      password: password,
    );
    await _sessionDataProvider.setTokenUser(user.token);
    await _sessionDataProvider.setUserId(user.id);
  }
}
