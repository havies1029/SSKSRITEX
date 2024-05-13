class Polis3CrudModel {
  bool isLeader;
  String rekanNama;
  String polis1Id;
  String polis3Id;
  double shareNilai;
  double sharePersen;
  String curr;

  Polis3CrudModel(
      {required this.isLeader,
      required this.polis1Id,
      required this.polis3Id,
      required this.shareNilai,
      required this.sharePersen,
      required this.rekanNama,
      required this.curr});

  factory Polis3CrudModel.fromJson(Map<String, dynamic> data) =>
      Polis3CrudModel(
          isLeader: bool.parse(data['isLeader'].toString()),
          rekanNama: data['rekanNama'] ?? "",
          polis1Id: data['polis1Id'] ?? "",
          polis3Id: data['polis3Id'] ?? "",
          curr: data['curr'] ?? "",
          shareNilai: double.parse(data['shareNilai'].toString()),
          sharePersen: double.parse(data['sharePersen'].toString()));

  Map<String, dynamic> toJson() => {
        'isLeader': isLeader.toString(),
        'polis1Id': polis1Id,
        'polis3Id': polis3Id,
        'curr': curr,
        'shareNilai': shareNilai.toString(),
        'sharePersen': sharePersen.toString(),
        'rekanNama': rekanNama
      };
}
