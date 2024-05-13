class Polis1ViewModel {
  String coverNo;
  double cstPremi;
  String insuredNama;
  DateTime periodeAkhir;
  DateTime periodeAwal;
  String polisNo;
  double tsi;
  String cobNama;
  String curr;

  Polis1ViewModel({
    required this.coverNo,
    required this.cstPremi,
    required this.insuredNama,
    required this.periodeAkhir,
    required this.periodeAwal,
    required this.polisNo,
    required this.tsi,
    required this.cobNama,
    required this.curr,
  });

  factory Polis1ViewModel.fromJson(Map<String, dynamic> data) {
    return Polis1ViewModel(
        coverNo: data['coverNo']??"",
        cstPremi: double.parse(data['cstPremi'].toString()),
        insuredNama: data['insuredNama']??"",
        periodeAkhir: DateTime.parse(data['periodeAkhir']),
        periodeAwal: DateTime.parse(data['periodeAwal']),
        polisNo: data['polisNo']??"",
        tsi: double.parse(data['tsi'].toString()),
        cobNama: data['cobNama'] ?? "",
        curr: data['curr'] ?? "");
  }

  Map<String, dynamic> toJson() {    

    return {
      'coverNo': coverNo,
      'cstPremi': cstPremi.toString(),
      'insuredNama': insuredNama,
      'periodeAkhir': periodeAkhir.toIso8601String(),
      'periodeAwal': periodeAwal.toIso8601String(),
      'polisNo': polisNo,
      'tsi': tsi.toString(),
      'cobNama': cobNama,
      'curr': curr,
    };
  }
}
