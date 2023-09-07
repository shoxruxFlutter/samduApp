import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:samduapp/config/configuration.dart';

class YuklamaApiClient {
  Future<void> downloadYuklama(
    int userId,
    String categoryFile,
    String token,
  ) async {
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

      print(response.statusCode);
    } else {
      print(response.statusCode);
    }
  }
}
