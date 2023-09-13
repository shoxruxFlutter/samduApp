import 'dart:convert';
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

  Future<void> uploadFile(
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

      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> checkingFile(
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
        const res = 'File exist';
        return res;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteNamunaviyFile(
    int userId,
    String categoryFile,
    String token,
  ) async {
    try {
      final res = await http.get(
          Uri.parse(
              '$deleteNamunaviy?user_id=$userId&category_file=$categoryFile'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      print(res.statusCode);
    } catch (e) {
      print(e);
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
