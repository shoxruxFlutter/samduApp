import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:samduapp/domain/services/yuklama_service.dart';

class YuklamaViewModel extends ChangeNotifier {
  final _yuklamaService = YuklamaService();

  YuklamaViewModel();

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
      final dd = result.files.single.path;
      File file = File(dd!);
      print(1);
      await uploadFile(file);
    } else {
      return null;
    }
  }

  Future<void> uploadFile(File file) async {
    try {
      final error = await _yuklamaService.uploadYuklama(
          userId: 2, categoryFile: 'qwerty', file: file);
      if (error != null) {}
      ;
    } catch (e) {
      print(e);
    }
  }
}
