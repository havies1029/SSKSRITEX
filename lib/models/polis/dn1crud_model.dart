class Dn1CrudModel {
	String curr;
	double dnAmount;
	String dnDesc;
	String dn1Id;
	DateTime dueDate;
	String endors1Id;
	String tipeDN;
	String placing1Id;

	Dn1CrudModel({required this.curr, required this.dnAmount, 
		required this.dnDesc, required this.dn1Id, 
		required this.dueDate, required this.endors1Id, 
		required this.tipeDN, required this.placing1Id});

	factory Dn1CrudModel.fromJson(Map<String, dynamic> data) =>
		Dn1CrudModel(
			curr: data['curr'],
			dnAmount: double.parse(data['dnAmount']),
			dnDesc: data['dnDesc'],
			dn1Id: data['dn1Id'],
			dueDate: DateTime.parse(data['dueDate']),
			endors1Id: data['endors1Id'],
			tipeDN: data['tipeDN'],
			placing1Id: data['placing1Id']
		);

	Map<String, dynamic> toJson() =>
		{'curr': curr,
		'dnAmount': dnAmount.toString(),
		'dnDesc': dnDesc,
		'dn1Id': dn1Id,
		'dueDate': dueDate.toIso8601String(),
		'endors1Id': endors1Id,
		'tipeDN': tipeDN,
		'placing1Id': placing1Id};

}
