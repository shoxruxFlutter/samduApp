import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';



class downloadFilee extends StatefulWidget {
  const downloadFilee({super.key});

  @override
  State<downloadFilee> createState() => _downloadFileeState();
}

class _downloadFileeState extends State<downloadFilee> {

  Future<void> downloadFile(String filename) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/download-file/$filename'));
  if (response.statusCode == 200) {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);
    // File saved successfully
  } else {
    print("error");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadFile("1.jpg");
          },
          child: Text('Press me'),
        ),
      ),
    );
  }
}