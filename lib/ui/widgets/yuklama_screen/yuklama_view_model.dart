import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:samduapp/domain/services/yuklama_service.dart';

class YuklamaViewModelFileTitle {
  final String namunaviyTitle = 'namunaviy';
  final String sillabusTitle = 'sillabus';
  final String yuklamaTitle = 'yuklama';
}

class YuklamaViewModel extends ChangeNotifier {
  final _yuklamaService = YuklamaService();
  final categoryFile = YuklamaViewModelFileTitle();

  bool _stateNamunaviy = false;
  bool get stateNamunaviy => _stateNamunaviy;
  bool get stateNamunaviyButton => !_stateNamunaviy;

  bool _stateSillabus = false;
  bool get stateSillabus => _stateSillabus;
  bool get stateSillabusButton => !_stateSillabus;

  bool _stateYuklama = false;
  bool get stateYuklama => _stateYuklama;
  bool get stateYuklamaButton => !_stateYuklama;

  YuklamaViewModel();

  Future<void> initAsync() async {
    await checkingFile();
  }

  Future<void> checkingFile() async {
    await checkingYuklama();
    await checkingNamunaviy();
    await checkingSillabus();
  }

  Future<void> downloadYuklama() async {
    try {
      await _yuklamaService.downloadYuklama(
          categoryFile: categoryFile.yuklamaTitle);
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkingYuklama() async {
    try {
      final resultCheck = await _yuklamaService.checkingFile(
          categoryFile: categoryFile.yuklamaTitle);
      if (resultCheck == true) {
        _stateYuklama = true;
        notifyListeners();
      }
    } catch (e) {
      _stateNamunaviy = false;
    }
  }

  Future<void> pickNamunaviyFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;
      final file = File(filePath!);

      await _uploadNamunaviy(file);
    }
  }

  Future<void> _uploadNamunaviy(File file) async {
    try {
      await _yuklamaService.uploadFile(
          file: file, categoryFile: categoryFile.namunaviyTitle);
      _stateNamunaviy = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkingNamunaviy() async {
    try {
      final resultCheck = await _yuklamaService.checkingFile(
          categoryFile: categoryFile.namunaviyTitle);
      if (resultCheck == true) {
        _stateNamunaviy = true;
        notifyListeners();
      }
    } catch (e) {
      _stateNamunaviy = false;
    }
  }

  Future<void> deleteNamunaviy() async {
    try {
      await _yuklamaService.deleteFile(
          categoryFile: categoryFile.namunaviyTitle);
      _stateNamunaviy = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> pickSillabusFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;
      final file = File(filePath!);

      await _uploadSillabus(file);
    }
  }

  Future<void> _uploadSillabus(File file) async {
    try {
      await _yuklamaService.uploadFile(
          file: file, categoryFile: categoryFile.sillabusTitle);
      _stateSillabus = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkingSillabus() async {
    try {
      final resultCheck = await _yuklamaService.checkingFile(
          categoryFile: categoryFile.sillabusTitle);
      if (resultCheck == true) {
        _stateSillabus = true;
        notifyListeners();
      }
    } catch (e) {
      _stateNamunaviy = false;
    }
  }

  Future<void> deleteSillabus() async {
    try {
      await _yuklamaService.deleteFile(
          categoryFile: categoryFile.sillabusTitle);
      _stateSillabus = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
