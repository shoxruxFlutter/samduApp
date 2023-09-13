import 'package:flutter/material.dart';
import 'package:samduapp/domain/api_client/yuklama_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class YuklamaService {
  final _sessionDataProvider = SessionDataProvider();
  final _yuklamaApiClient = YuklamaApiClient();

  Future<void> downloadYuklama({
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _yuklamaApiClient.downloadYuklama(userId, categoryFile, getToken);
  }

  Future<void> uploadFile({
    required file,
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _yuklamaApiClient.uploadFile(userId, categoryFile, getToken, file);
  }

  Future<bool?> checkingFile({required String categoryFile}) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return false;
    final userId = int.parse(userIdString);
    final res =
        await _yuklamaApiClient.checkingFile(userId, categoryFile, getToken);
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteFile({
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _yuklamaApiClient.deleteNamunaviyFile(userId, categoryFile, getToken);
  }
}
