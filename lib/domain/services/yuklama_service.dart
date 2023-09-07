import 'package:samduapp/domain/api_client/yuklama_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';

class YuklamaService {
  final _userToken = SessionDataProvider();
  final _yuklamaApiClient = YuklamaApiClient();

  Future<void> downloadYuklama({
    required String categoryFile,
    required int userId,
  }) async {
    final getToken = await _userToken.tokenUser;
    _yuklamaApiClient.downloadYuklama(userId, categoryFile, getToken!);
  }
}