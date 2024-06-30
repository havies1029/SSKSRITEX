import 'dart:io';
import 'package:ecargo_app/common/app_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'file_manager_interface.dart';

class FileManager implements FileManagerInterface {
  @override
  Future<void> uploadFile(String urlUploadEndPoint,
      {Map<String, String>? queryParams}) async {
    final result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    if (path == null) return;
    final bytes = await File(path).readAsBytes();
    var uri =
        AppData.uriHtpp(AppData.httpAuthority, urlUploadEndPoint, queryParams);
    await http.post(uri, headers: AppData.httpHeaders, body: bytes);
    debugPrint('Image uploaded successfully.');
  }

  @override
  Future<void> downloadFile(String urlDownloadEndPoint, String fileName,
      {Map<String, String>? queryParams}) async {
    debugPrint("io -> downloadFile");
    var uri = AppData.uriHtpp(
        AppData.httpAuthority, urlDownloadEndPoint, queryParams);
    var response = await http.get(uri, headers: AppData.httpHeaders);
    final path = await FilePicker.platform.saveFile(fileName: fileName);
    if (path == null) return;
    final saveFile = File(path);
    await saveFile.writeAsBytes(response.bodyBytes);
    debugPrint(path);
  }
}
