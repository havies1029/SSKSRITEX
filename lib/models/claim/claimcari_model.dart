class ClaimCariModel {
	DateTime dol;
	String klaimLokasi;
	String klaim1Id;
	double lossAcc;
	double lossEst;
	String tolName;
	String curr;
	String statusKlaim;

	ClaimCariModel({required this.dol, required this.klaimLokasi, 
		required this.klaim1Id, required this.lossAcc, 
		required this.lossEst, required this.tolName, 
		required this.curr, required this.statusKlaim});

	factory ClaimCariModel.fromJson(Map<String, dynamic> data) =>
		ClaimCariModel(
			dol: DateTime.parse(data['dol']),
			klaimLokasi: data['klaimLokasi']??"",
			klaim1Id: data['klaim1Id']??"",
			lossAcc: double.parse(data['lossAcc'].toString()),
      //lostAcc: 15000000000,
			lossEst: double.parse(data['lossEst'].toString()),
      //lostEst: 13500000000,
			tolName: data['tolName']??"",
			curr: data['curr']??"",
			statusKlaim: data['statusKlaim']??""
		);

	Map<String, dynamic> toJson() =>
		{'dol': dol.toIso8601String(),
		'klaimLokasi': klaimLokasi,
		'klaim1Id': klaim1Id,
		'lossAcc': lossAcc.toString(),
		'lossEst': lossEst.toString(),
		'tolName': tolName,
		'curr': curr,
		'statusKlaim': statusKlaim};

}
