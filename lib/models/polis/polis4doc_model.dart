import 'dart:convert';
import 'dart:typed_data';

class Polis4DocModel {
  String namafile;
  String tipefile;
  String mimetype;
  String ukuran;  
  Uint8List datafile;

  Polis4DocModel(
      {required this.namafile,
      required this.tipefile,
      required this.mimetype,
      required this.ukuran,
      required this.datafile});

  factory Polis4DocModel.fromJson(Map<String, dynamic> data) => Polis4DocModel(
      namafile: data['namafile'],
      tipefile: data['tipefile'],
      mimetype: data['mimetype'],
      ukuran: data['ukuran'],
      datafile: base64.decode(data['datafile']));


  Map<String, dynamic> toJson() => {
        "namafile": namafile,
        "tipefile": tipefile,
        "mimetype": mimetype,
        "ukuran": ukuran,
        "datafile": base64.encode(datafile),
      };
}
