import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:samduapp/config/configuration.dart';

class YuklamaApiClient {
  Future<void> downloadYuklama(
    int userId,
    String categoryFile,
    String token,
  ) async {
    try {
      final response = await http.get(
          Uri.parse(
              '$downloadYuklamaUrl?user_id=$userId&category_file=$categoryFile'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        final fileName = response.headers['content-disposition']
            ?.split(';')
            .last
            .replaceAll('filename=', '')
            .replaceAll('"', '');

        var myPath = '/storage/emulated/0/Download/$fileName';

        final file = File(myPath);
        await file.writeAsBytes(response.bodyBytes);
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> uploadFile(
    int userId,
    String categoryFile,
    String token,
    File file,
  ) async {
    try {
      final url = Uri.parse(
          '$uploadYuklamaUrl?user_id=$userId&category_file=$categoryFile');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'application/json';
      final multipartFile =
          await http.MultipartFile.fromPath('file', file.path);
      request.files.add(multipartFile);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 403) {
        final error = response.body;
        return error;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
