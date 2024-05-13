import 'package:flutter/material.dart';

class Polis4CrudModel {
  String dokCaption;
  String tipeDoc;
  String polis1Id;
  String polis4Id;
  String filename;

  Polis4CrudModel(
      {required this.dokCaption,
      required this.tipeDoc,
      required this.polis1Id,
      required this.polis4Id,
      required this.filename});

  factory Polis4CrudModel.fromJson(Map<String, dynamic> data) {
    
    debugPrint(data.toString());

    return Polis4CrudModel(
        dokCaption: data['dokCaption'] ?? "",
        tipeDoc: data['tipeDoc'] ?? "",
        polis1Id: data['polis1Id'] ?? "",
        polis4Id: data['polis4Id'] ?? "",
        filename: data['filename'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'dokCaption': dokCaption,
        'tipeDoc': tipeDoc,
        'polis1Id': polis1Id,
        'polis4Id': polis4Id,
        'filename': filename
      };
}
