import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;

import '../../services/user_service.dart';


class Upload extends StatefulWidget {
  final String titleFile;
  const Upload({super.key, required this.titleFile});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String fileName = '';
  bool downloadSuccess = false;
  Response? response;
  Dio dio =  Dio();
  File? selectedfile;
  double progress = 0.0;
  String link = '';
  Future<int> fileUserId = getUserId();

  var _progress = "";
  final _dio = Dio();
  String _fileName = '';
 
  bool _fileExists = false;

  @override
  void initState() {
    super.initState();
    _checkFileExists();
  }

Future<void> downloadFile() async {

    final url = "http://10.0.2.2:8000/api/downloadFile";
    String token = await getToken();
    
    final params = {
      "category_file": widget.titleFile,
    };

    

    final directory = await getExternalStorageDirectory();
    final filePath = '${directory?.path}/${widget.titleFile}.pdf';
    final file = File(filePath);

    try {
      
      final response = await _dio.download(
        url,
        filePath,
        queryParameters: params,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes != -1) {
            setState(() {
              _progress = "Downloaded ${(receivedBytes / totalBytes * 100).toStringAsFixed(0)}%";
            });
          }
        },
      );

      print(response.statusCode);
    } catch (e) {
      print(e);
    }

  }

Future upload() async {


  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if(result!=null){
    // File file = File(result.files.single.path ?? " ");
    PlatformFile file = result.files.first;
    print(file.path);
    // String fileName = file.path.split('/').last;
    String? filepath = file.path;
    String? fileExtension = file.extension;
   FormData data = FormData.fromMap({

      "file": await MultipartFile.fromFile(
        filepath!,
        filename: '${widget.titleFile}.${fileExtension!}',
        contentType: MediaType("image", "jpeg"),),
        'category_file': widget.titleFile,


    
   });

  String token = await getToken();
   
var response = await dio.post(
"http://10.0.2.2:8000/api/upload-file", 
data: data,
options: Options(
  headers: {'Authorization': 'Bearer $token'},
  followRedirects: false,
  validateStatus: (status) { return status! <= 500; }
  
),
 onSendProgress: (int sent, int total){
  print("$sent, $total");
});
setState(() {
    _checkFileExists();
  });
}
else{
  print("result null");
}

}

void _checkFileExists() async {
  String token = await getToken();
  final params = {
      "category_file": widget.titleFile,
    };

    final response = await Dio().get(
    'http://10.0.2.2:8000/api/checkingFile',  
    queryParameters: {'category_file': params, },
    options: Options(
        headers: {'Authorization': 'Bearer $token'},
        followRedirects: false,
        validateStatus: (status) => true,
        contentType: 'application/json',
    )
      );
      print(response.data);
      print(232);
     setState(() {
      if (response.data == "true"){
      _fileExists = true;
      }
      if (_fileExists) {
        _fileName = '${widget.titleFile}.pdf';
      }
      print(_fileExists);
    });
}

Future<void> showFile() async {
  try {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory?.path}/${widget.titleFile}.pdf';
    final file = File(filePath);
    final fileExists = await file.exists();
    if (fileExists) {
      final bytes = await file.readAsBytes();
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/${widget.titleFile}.pdf';
      await File(tempPath).writeAsBytes(bytes);

      final channel = MethodChannel('channel');
      await channel.invokeMethod('openFile', {'path': tempPath});
    } else {
      print('File does not exist');
    }
  } catch (e) {
    print('Error opening file: $e');
  }
}
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_fileExists)
              Text(
                'File name: $_fileName',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 20),
            if (_fileExists)
              ElevatedButton(
                onPressed: downloadFile,
                child: Text('Download'),
              ),
            if (!_fileExists)
              ElevatedButton(
                onPressed: upload,
                child: Text('Upload'),
              ),
          ],
        ),
      ),
    );
  }
}


