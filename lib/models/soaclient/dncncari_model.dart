class DncnCariModel {
  String coverNo;
  String curr;
  DateTime dueDate;
  String endors1Id;
  String insuredName;
  double invAmount;
  String inv1Id;
  String polisNo;
  String invType;

  DncnCariModel(
      {required this.coverNo,
      required this.curr,
      required this.dueDate,
      required this.endors1Id,
      required this.insuredName,
      required this.invAmount,
      required this.inv1Id,
      required this.polisNo,
      required this.invType});

  factory DncnCariModel.fromJson(Map<String, dynamic> data) => DncnCariModel(
      coverNo: data['coverNo'],
      curr: data['curr'],
      dueDate: DateTime.parse(data['dueDate']),
      endors1Id: data['endors1Id'],
      insuredName: data['insuredName'],
      invAmount: double.parse(data['invAmount'].toString()),
      inv1Id: data['inv1Id'],
      polisNo: data['polisNo'],
      invType: data['invType']);

  Map<String, dynamic> toJson() => {
        'coverNo': coverNo,
        'curr': curr,
        'dueDate': dueDate.toIso8601String(),
        'endors1Id': endors1Id,
        'insuredName': insuredName,
        'invAmount': invAmount.toString(),
        'inv1Id': inv1Id,
        'polisNo': polisNo,
        'invType': invType
      };
}
