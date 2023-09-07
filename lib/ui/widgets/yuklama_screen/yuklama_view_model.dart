import 'package:flutter/material.dart';
import 'package:samduapp/domain/services/yuklama_service.dart';

class YuklamaViewModel extends ChangeNotifier {
  final int userId;
  final String categoryFile;

  final _yuklamaService = YuklamaService();

  YuklamaViewModel({
    required this.userId,
    required this.categoryFile,
  });

  Future<void> downloadYuklama() async {
    try {
      await _yuklamaService.downloadYuklama(
        userId: userId,
        categoryFile: categoryFile,
      );
    } catch (e) {
      print(e);
    }
  }
}
