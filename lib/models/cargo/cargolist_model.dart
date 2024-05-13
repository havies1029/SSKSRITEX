class CargoListModel{

	  String conveyBy;
	  DateTime etdDate;
	  String kirimDari;  
    String kirimKe;
    String penerima;
    String pengirim;
    String sppaNo;
    double tsiAmount;
    String tsiCurr;
  

	CargoListModel({required this.conveyBy, required this.etdDate, 
    required this.kirimDari,   
    required this.kirimKe, required this.penerima, 
    required this.pengirim, required this.sppaNo, required this.tsiAmount, 
    required this.tsiCurr
  
  });

  factory CargoListModel.fromJson(Map<String, dynamic> data) =>
      CargoListModel(
        conveyBy: data['conveyBy'],
        etdDate: DateTime.parse(data['etdDate']),
        kirimDari: data['kirimDari'],
        kirimKe: data['kirimKe'],
        penerima: data['penerima'],
        pengirim: data['pengirim'],
        sppaNo: data['sppaNo'],
        tsiAmount: double.parse(data['tsiAmount'].toString()),
        tsiCurr: data['tsiCurr']
  );

  Map<String, dynamic> toJson() => {
    'conveyBy': conveyBy,    
		'etdDate': etdDate.toIso8601String(),
    'kirimDari': kirimDari,
    'kirimKe': kirimKe,
		'penerima': penerima,
		'pengirim': pengirim,
		'sppaNo': sppaNo,
		'tsiAmount': tsiAmount.toString(),
		'tsiCurr': tsiCurr
  };
}