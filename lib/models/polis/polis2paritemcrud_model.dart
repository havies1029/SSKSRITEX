class Polis2paritemCrudModel {
  double coverPersen;
  String itemDesc;
  String mparitemId;
  String polis2parId;
  String polis2paritemId;
  double premi;
  double siNilai;

  Polis2paritemCrudModel(
      {required this.coverPersen,
      required this.itemDesc,
      required this.mparitemId,
      required this.polis2parId,
      required this.polis2paritemId,
      required this.premi,
      required this.siNilai});

  factory Polis2paritemCrudModel.fromJson(Map<String, dynamic> data) =>
      Polis2paritemCrudModel(
          coverPersen: data['coverPersen'],
          itemDesc: data['itemDesc'] ?? "",
          mparitemId: data['mparitemId'] ?? "",
          polis2parId: data['polis2parId'] ?? "",
          polis2paritemId: data['polis2paritemId'] ?? "",
          premi: double.parse(data['premi'].toString()),
          siNilai: double.parse(data['siNilai'].toString()));

  Map<String, dynamic> toJson() => {
        'coverPersen': coverPersen,
        'itemDesc': itemDesc,
        'mparitemId': mparitemId,
        'polis2parId': polis2parId,
        'polis2paritemId': polis2paritemId,
        'premi': premi.toString(),
        'siNilai': siNilai.toString()
      };
}
