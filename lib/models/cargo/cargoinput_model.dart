import 'package:ecargo_app/models/cargo/cargobarang_model.dart';

class CargoInputModel {
  String sppaId = "";
  String pengirim = "";
  String penerima = "";
  DateTime etd;
  String listbarang = "";
  int alatAngkut = 0;
  String kirimFrom = "";
  String kirimTo = "";
  String tsiCurr = "";
  double tsiAmount = 0;
  String kapalNama = "";
  List<CargoBarangModel> items;  

  CargoInputModel(
      {required this.sppaId,
      required this.pengirim,
      required this.penerima,
      required this.etd,
      required this.listbarang,
      required this.alatAngkut,
      required this.kirimFrom,
      required this.kirimTo,
      required this.tsiCurr,
      required this.tsiAmount,
      required this.kapalNama,
      required this.items});

  factory CargoInputModel.fromJson(Map<String, dynamic> data) {
    
    List<CargoBarangModel> items = List<CargoBarangModel>.from(
        data["items"].map((e) => CargoBarangModel.fromJson(e)));

    return CargoInputModel(
      sppaId: data["sppaId"],
      pengirim: data["pengirim"],
      penerima: data["penerima"],
      etd: DateTime.parse(data["etd"]),
      listbarang: data["listbarang"],
      alatAngkut: int.parse(data["alatAngkut"]),
      kirimFrom: data["kirimFrom"],
      kirimTo: data["kirimTo"],
      tsiCurr: data["tsiCurr"],
      tsiAmount: double.parse(data["tsiAmount"].toString()),
      kapalNama: data["kapalNama"], 
      items: items,
    );
  }

  Map<String, dynamic> toJson() {

    List<Map<String, dynamic>> listItem =
        items.map((e) => e.toJson()).toList();

    return {
        "sppaId": sppaId,
        "pengirim": pengirim,
        "penerima": penerima,
        "etd": etd.toIso8601String(),
        "listbarang": listbarang,
        "alatAngkut": alatAngkut.toString(),
        "kirimFrom": kirimFrom,
        "kirimTo": kirimTo,
        "tsiCurr": tsiCurr,
        "tsiAmount": tsiAmount.toString(),
        "kapalNama": kapalNama,
        "items": listItem
      };
  }
}
