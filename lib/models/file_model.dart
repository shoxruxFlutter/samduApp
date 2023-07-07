// To parse this JSON data, do
//
//     final fileModel = fileModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
    this.fileName,
    this.url,
    this.progress,
  });

  String? fileName;
  String? url;
  double? progress;

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        fileName: json["fileName"],
        url: json["url"],
        progress: json["progress"] == null ? null : json["progress"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "url": url,
        "progress": progress,
      };
}