import 'package:ecargo_app/models/polis/polis2paritemcrud_model.dart';

class Polis2parCrudModel {
  String lokasiAlamat1;
  String lokasiAlamat2;
  String okupasiNama;
  String okupasiKode;
  String polis1Id;
  String polis2parId;
  double totalPremi;
  double tsiNilai;
  List<Polis2paritemCrudModel>? listParItem;

  Polis2parCrudModel(
      {required this.lokasiAlamat1,
      required this.lokasiAlamat2,
      required this.okupasiNama,
      required this.okupasiKode,
      required this.polis1Id,
      required this.polis2parId,
      required this.totalPremi,
      required this.tsiNilai,
      this.listParItem});

  factory Polis2parCrudModel.fromJson(Map<String, dynamic> data) {

    List<Polis2paritemCrudModel>? items;
    if (data["listParItem"] != null) {
      items = List<Polis2paritemCrudModel>.from(
          data["listParItem"].map((e) => Polis2paritemCrudModel.fromJson(e)));
    }

    return Polis2parCrudModel(
        lokasiAlamat1: data['lokasiAlamat1'] ?? "",
        lokasiAlamat2: data['lokasiAlamat2'] ?? "",
        okupasiNama: data['okupasiNama'] ?? "",
        okupasiKode: data['okupasiKode'] ?? "",
        polis1Id: data['polis1Id'] ?? "",
        polis2parId: data['polis2parId'] ?? "",
        totalPremi: double.parse(data['totalPremi'].toString()),
        tsiNilai: double.parse(data['tsiNilai'].toString()),
        listParItem: items);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? items;
    if (listParItem != null) {
      items = listParItem!.map((e) => e.toJson()).toList();
    }

    return {
      'lokasiAlamat1': lokasiAlamat1,
      'lokasiAlamat2': lokasiAlamat2,
      'polis1Id': polis1Id,
      'polis2parId': polis2parId,
      'totalPremi': totalPremi.toString(),
      'okupasiNama': okupasiNama,
      'okupasiKode': okupasiKode,
      'tsiNilai': tsiNilai.toString(),
      'listParItem': items
    };
  }
}
