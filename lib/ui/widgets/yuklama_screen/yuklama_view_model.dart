import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:samduapp/domain/services/yuklama_service.dart';

class YuklamaViewModel extends ChangeNotifier {
  late File _file = File('');
  final _yuklamaService = YuklamaService();

  YuklamaViewModel();

  Future<void> initAsync() async {
    await uploadFile();
  }

  Future<String?> checkingFile() async {
    final result = await _yuklamaService.checkingYuklama(
        categoryFile: 'qwerty', userId: 2);
    return result;
  }

  Future<void> downloadYuklama() async {
    try {
      await _yuklamaService.downloadYuklama(
        userId: 2,
        categoryFile: 'qwerty',
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;
      _file = File(filePath!);

      await uploadFile();
    }
  }

  Future<void> uploadFile() async {
    try {
      final error = await _yuklamaService.uploadYuklama(
          userId: 2, categoryFile: 'qwerty', file: _file);
      if (error != null) {}
      ;
    } catch (e) {
      print(e);
    }
  }
}
