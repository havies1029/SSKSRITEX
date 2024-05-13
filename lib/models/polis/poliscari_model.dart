class PolisCariModel {
	String coverNo;
	double cstPremi;
	String insuredNama;
	DateTime periodeAkhir;
	DateTime periodeAwal;
	String? placing1Id;
	DateTime? polisIssued;
	String polisNo;
	String polis1Id;
	double tsi;
	String cobNama;
	String curr;

	PolisCariModel({required this.coverNo, required this.cstPremi, 
    required this.insuredNama, required this.periodeAkhir, 
    required this.periodeAwal, required this.placing1Id, 
    this.polisIssued, required this.polisNo, 
    required this.polis1Id, required this.tsi,
    required this.cobNama, required this.curr});

	factory PolisCariModel.fromJson(Map<String, dynamic> data) =>
		PolisCariModel(
			coverNo: data['coverNo']??"",
			cstPremi: double.parse(data['cstPremi'].toString()),
			insuredNama: data['insuredNama']??"",
			periodeAkhir: DateTime.parse(data['periodeAkhir']),
			periodeAwal: DateTime.parse(data['periodeAwal']),
			placing1Id: data['placing1Id']??"",
			polisIssued: DateTime.tryParse(data['polisIssued']),
			polisNo: data['polisNo']??"",
			polis1Id: data['polis1Id']??"",
			tsi: double.parse(data['tsi'].toString()),
			cobNama: data['cobNama']??"",
			curr: data['curr']??""
		);

	Map<String, dynamic> toJson() =>
		{'coverNo': coverNo,
		'cstPremi': cstPremi.toString(),
		'insuredNama': insuredNama,
		'periodeAkhir': periodeAkhir.toIso8601String(),
		'periodeAwal': periodeAwal.toIso8601String(),
		'placing1Id': placing1Id,
		'polisIssued': polisIssued?.toIso8601String(),
		'polisNo': polisNo,
		'polis1Id': polis1Id,
		'tsi': tsi.toString(),
		'cobNama': cobNama,
		'curr': curr};

}
