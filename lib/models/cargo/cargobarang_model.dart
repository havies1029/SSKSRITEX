import 'dart:typed_data';

class CargoBarangModel {
  String? cargoItemId;
  String barangNama = "";
  double harga = 0;
  Uint8List? fotoBrg;

  CargoBarangModel(
      {this.cargoItemId,
      required this.barangNama,
      required this.harga,
      this.fotoBrg});

  factory CargoBarangModel.fromJson(Map<String, dynamic> data) => 
    CargoBarangModel(
      cargoItemId: data["cargoItemId"],
      barangNama: data["barangNama"],
      harga: double.parse(data["harga"]),
      fotoBrg: data["fotoBrg"]);

  Map<String, dynamic> toJson() => {
        "cargoItemId": cargoItemId,
        "barangNama": barangNama,
        "harga": harga,
        "fotoBrg": fotoBrg,
      };
}
