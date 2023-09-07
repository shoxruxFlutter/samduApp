import 'dart:io';
import 'package:dio/dio.dart';

// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../services/user_service.dart';

class Upload extends StatefulWidget {
  final String titleFile;
  final int teacherId;
  const Upload({super.key, required this.titleFile, required this.teacherId});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String fileName = '';
  bool downloadSuccess = false;
  Response? response;
  Dio dio = Dio();
  File? selectedfile;
  double progress = 0.0;
  String link = '';
  Future<int> fileUserId = getUserId();
  final _dio = Dio();
  String _fileName = '';
  final List<String> category = ['1', '2', '3'];
  bool _fileExists = false;
  final fanVasoat = '1';
  final oquvDastur = '2';
  final ishchiDastur = '3';

  @override
  void initState() {
    super.initState();
    _checkFileExists();
  }

  Future<void> downloadFile() async {
    const url = "http://10.0.2.2:8000/api/downloadFile";
    String token = await getToken();

    final params = {
      "category_file": widget.titleFile,
    };

    final directory = await getExternalStorageDirectory();

    final filePath = '${directory?.path}/${widget.titleFile}.pdf';

    try {
      // ignore: unused_local_variable
      final response = await _dio.download(
        url,
        filePath,
        queryParameters: params,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes != -1) {
            setState(() {});
          }
        },
      );

      // ignore: empty_catches
    } catch (e) {}
  }

  Future upload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      String? filepath = file.path;
      String? fileExtension = file.extension;
      FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          filepath!,
          filename: '${widget.titleFile}.${fileExtension!}',
          contentType: MediaType("image", "jpeg"),
        ),
        'category_file': widget.titleFile,
      });

      String token = await getToken();

// ignore: unused_local_variable
      var response = await dio.post("http://10.0.2.2:8000/api/upload-file",
          data: data,
          options: Options(
              headers: {'Authorization': 'Bearer $token'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }), onSendProgress: (int sent, int total) {
        // print("$sent, $total");
      });
      setState(() {
        _checkFileExists();
      });
    } else {
      // print("result null");
    }
  }

  void _checkFileExists() async {
    String token = await getToken();
    int teacherId = widget.teacherId;
    String nameFile = widget.titleFile;

    final response = await Dio().get(
        'http://10.0.2.2:8000/api/checkingFile/$nameFile',
        //'http://10.0.2.2:8000/api/checkingFile?$teacherId&category=$category',

        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          followRedirects: false,
          validateStatus: (status) => true,
          contentType: 'application/json',
        ));

    setState(() {
      if (response.data == "true") {
        _fileExists = true;
      }
      if (_fileExists) {
        _fileName = '${widget.titleFile}.pdf';
      }
      print(_fileExists);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuklamalar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_fileExists)
              Text(
                'Faylning nomi: $_fileName',
                style: const TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 20),
            if (_fileExists)
              ElevatedButton(
                onPressed: downloadFile,
                child: const Text('Download'),
              ),
            if (!_fileExists)
              ElevatedButton(
                onPressed: upload,
                child: const Text('Upload'),
              ),
          ],
        ),
      ),
    );
  }
//     );
// return Scaffold(
//         appBar: AppBar(
//         title: const Text('Yuklamalar'),
//         backgroundColor: Colors.blue,
//       ),
//        body: ListView.builder(

//        padding: const EdgeInsets.all(15),
//        itemCount: category.length,
//        itemBuilder: (BuildContext context, int index) {
//         final fileName = category[index];
//         final existFile =  _checkFileExists(fileName);

//            return Column(
//              children: [
//              if (existFile == true)
//              Text(
//                'Faylning nomi: $_fileName',
//                style: const TextStyle(fontSize: 20),
//              ),
//               const SizedBox(height: 20),
//            if (existFile == true)
//              ElevatedButton(
//                onPressed: downloadFile,
//                child: const Text('Download'),
//              ),
//            if (existFile == false)
//              ElevatedButton(
//                onPressed: upload,
//                child: const Text('Upload'),
//              ),
//              ]
//            );
//        }

//       ),
//     );
}
