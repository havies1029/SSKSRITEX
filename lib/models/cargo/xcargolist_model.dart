class CargoListModelx {
	  String conveyBy;
	//final DateTime? etdDate;
	  String kirimDari;
  /*
	final String kirimKe;
	final String penerima;
	final String pengirim;
	final String sppaNo;
	//final double tsiAmount;
	final String tsiCurr;
  */

	CargoListModelx({required this.conveyBy, //this.etdDate, 
    required this.kirimDari, 
  /*
  required this.kirimKe, required this.penerima, 
  required this.pengirim, required this.sppaNo, //required this.tsiAmount, 
  required this.tsiCurr
  */
  });

	factory CargoListModelx.fromJson(Map<String, dynamic> data) =>
		CargoListModelx(
			conveyBy: data['conveyBy'],
			//etdDate: DateTime.parse(data['etdDate']),
			kirimDari: data['kirimDari'],
      /*
			kirimKe: data['kirimKe'],
			penerima: data['penerima'],
			pengirim: data['pengirim'],
			sppaNo: data['sppaNo'],
			//tsiAmount: double.parse(data['tsiAmount']),
			tsiCurr: data['tsiCurr']
      */
		);

	Map<String, dynamic> toJson() =>
		{'conveyBy': conveyBy,
		//'etdDate': etdDate.toIso8601String(),
		'kirimDari': kirimDari,
    /*
		'kirimKe': kirimKe,
		'penerima': penerima,
		'pengirim': pengirim,
		'sppaNo': sppaNo,
		//'tsiAmount': tsiAmount.toString(),
		'tsiCurr': tsiCurr
    */
    };	
}
