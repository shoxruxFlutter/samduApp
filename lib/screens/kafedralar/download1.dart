import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:samduapp/models/file_model.dart';


class downloadFile extends StatefulWidget {
  const downloadFile({super.key});

  @override
  State<downloadFile> createState() => _downloadFileState();
}

class _downloadFileState extends State<downloadFile> {
  List<FileModel> fileList = [];
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;

   @override
  void initState() {
    super.initState();

    initPlatformState();
    generateFileList();
  }

   generateFileList() {
    fileList
      ..add(FileModel(
        fileName: "loremipsum.pdf",
        url:
            "http://10.0.2.2:8000/api/upload-file",
        progress: 0.0,
      ));
   }

   Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();

    String _localPath = _path.path + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    path = _localPath;
  }


generateWidgetList() {
    List<Widget> widgetList = [];

    fileList.asMap().forEach((index, element) {
      widgetList.add(Row(
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(fileList[index].fileName!),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () async {
              options = DownloaderUtils(
                progressCallback: (current, total) {
                  final progress = (current / total) * 100;
                  print('Downloading: $progress');

                  setState(() {
                    fileList[index].progress = (current / total);
                  });
                },
                file: File('$path/${fileList[index].fileName}'),
                progress: ProgressImplementation(),
                onDone: () {
                  setState(() {
                    fileList[index].progress = 0.0;
                  });
                  OpenFile.open('$path/${fileList[index].fileName}')
                      .then((value) {
                    // delete the file.
                    File f = File('$path/${fileList[index].fileName}');
                    f.delete();
                  });
                },
                deleteOnCancel: true,
              );
              core = await Flowder.download(
                fileList[index].url!,
                options,
              );
            },
            child: Column(
              children: [
                if (fileList[index].progress == 0.0)
                  Icon(
                    Icons.download,
                  ),
                if (fileList[index].progress != 0.0)
                  LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 14.0,
                    percent: fileList[index].progress!,
                    backgroundColor: Colors.blue,
                    progressColor: Colors.white,
                  ),
              ],
            ),
          ),
        ],
      ));
    });

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ...generateWidgetList(),
          ],
        ),
      ),
    );
  }
}