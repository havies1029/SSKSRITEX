class DnCnModel {
  double dncnAmount;
  String dncnId;
  DateTime dueDate;
  String endors1Id;
  String placing1Id;
  String groupId;

  DnCnModel(
      {required this.dncnAmount,
      required this.dncnId,
      required this.dueDate,
      required this.endors1Id,
      required this.placing1Id,
      required this.groupId});

  factory DnCnModel.fromJson(Map<String, dynamic> data) => DnCnModel(
      dncnAmount: double.parse(data['dncnAmount'].toString()),
      dncnId: data['dncnId']?? "",
      dueDate: DateTime.parse(data['dueDate']),
      endors1Id: data['endors1Id']?? "",
      placing1Id: data['placing1Id']?? "",
      groupId: data['groupId']?? "");

  Map<String, dynamic> toJson() =>
		{'dncnAmount': dncnAmount.toString(),		
		'dncnId': dncnId,
		'dueDate': dueDate.toIso8601String(),
		'endors1Id': endors1Id,		
		'placing1Id': placing1Id,		
		'groupId': groupId};
}
