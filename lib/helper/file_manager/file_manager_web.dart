import 'package:ecargo_app/common/app_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'file_manager_interface.dart';

class FileManager implements FileManagerInterface {
  @override
  Future<void> uploadFile(String urlUploadEndPoint,
      {Map<String, String>? queryParams}) async {
    final result = await FilePicker.platform.pickFiles();
    final bytes = result?.files.single.bytes;
    if (bytes == null) return;
    var uri =
        AppData.uriHtpp(AppData.httpAuthority, urlUploadEndPoint, queryParams);
    await http.post(uri, headers: AppData.httpHeaders, body: bytes);
    debugPrint('Image uploaded successfully.');
  }

  @override
  Future<void> downloadFile(String urlDownloadEndPoint, String fileName,
      {Map<String, String>? queryParams}) async {
    debugPrint("web -> downloadFile #10");

    try {
      var uri = AppData.uriHtpp(
          AppData.httpAuthority, urlDownloadEndPoint, queryParams);
      var response = await http.get(uri, headers: AppData.httpHeaders);
      //debugPrint("web -> downloadFile #20");
      final blob = html.Blob([response.bodyBytes]);
      final anchorElement = html.AnchorElement(
        href: html.Url.createObjectUrlFromBlob(blob).toString(),
      )..setAttribute('download', fileName);
      //debugPrint("web -> downloadFile #40");
      html.document.body!.children.add(anchorElement);
      //debugPrint("web -> downloadFile #50");
      anchorElement.click();
      //debugPrint("web -> downloadFile #60");
      html.document.body!.children.remove(anchorElement);
      //debugPrint("web -> downloadFile #70");
      //debugPrint('response.bodyBytes.length : ${response.bodyBytes.length}');
    } catch (ex) {
      debugPrint("Error web download ex: ${ex.toString()}");
    }
  }
}
