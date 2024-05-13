class Cn1CrudModel {
	double cnAmount;
	String cnDesc;
	String cn1Id;
	String curr;
	DateTime dueDate;
	String endors1Id;
	String tipeCN;
	String placing1Id;

	Cn1CrudModel({required this.cnAmount, required this.cnDesc, 
		required this.cn1Id, required this.curr, 
		required this.dueDate, required this.endors1Id, 
		required this.tipeCN, required this.placing1Id});

	factory Cn1CrudModel.fromJson(Map<String, dynamic> data) =>
		Cn1CrudModel(
			cnAmount: double.parse(data['cnAmount']),
			cnDesc: data['cnDesc'],
			cn1Id: data['cn1Id'],
			curr: data['curr'],
			dueDate: DateTime.parse(data['dueDate']),
			endors1Id: data['endors1Id'],
			tipeCN: data['tipeCN'],
			placing1Id: data['placing1Id']
		);

	Map<String, dynamic> toJson() =>
		{'cnAmount': cnAmount.toString(),
		'cnDesc': cnDesc,
		'cn1Id': cn1Id,
		'curr': curr,
		'dueDate': dueDate.toIso8601String(),
		'endors1Id': endors1Id,
		'tipeCN': tipeCN,
		'placing1Id': placing1Id};

}
