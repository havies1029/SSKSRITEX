import 'package:ecargo_app/models/polis/dncn_model.dart';
import 'package:ecargo_app/models/polis/endors1crud_model.dart';
import 'package:ecargo_app/models/polis/polis2parcrud_model.dart';
import 'package:ecargo_app/models/polis/polis3crud_model.dart';
import 'package:ecargo_app/models/polis/polis4crud_model.dart';

class Polis1CrudModel {
  String coverNo;
  double cstPremi;
  String insuredNama;
  DateTime periodeAkhir;
  DateTime periodeAwal;
  String placing1Id;
  DateTime? polisIssued;
  String polisNo;
  String polis1Id;
  double tsi;
  String cobNama;
  String curr;
  List<Polis2parCrudModel>? listObj;
  List<Polis3CrudModel> listSecurity;
  List<Polis4CrudModel>? listDoc;
  List<Endors1CrudModel>? listEndors;
  List<DnCnModel>? listDnCn;

  Polis1CrudModel(
      {required this.coverNo,
      required this.cstPremi,
      required this.insuredNama,
      required this.periodeAkhir,
      required this.periodeAwal,
      required this.placing1Id,
      this.polisIssued,
      required this.polisNo,
      required this.polis1Id,
      required this.tsi,
      required this.cobNama,
      required this.curr,
      this.listObj,
      required this.listSecurity,
      this.listDoc,
      this.listEndors,
      this.listDnCn});

  factory Polis1CrudModel.fromJson(Map<String, dynamic> data) {
    List<Polis2parCrudModel>? listItemObj;
    if (data["listObj"] != null) {
      listItemObj = List<Polis2parCrudModel>.from(
          data["listObj"].map((e) => Polis2parCrudModel.fromJson(e)));
    }

    List<Polis3CrudModel> listItemSecurity = List<Polis3CrudModel>.from(
        data["listSecurity"].map((e) => Polis3CrudModel.fromJson(e)));

    List<Polis4CrudModel>? listItemDoc;
    if (data["listDoc"] != null) {
      listItemDoc = List<Polis4CrudModel>.from(
          data["listDoc"].map((e) => Polis4CrudModel.fromJson(e)));
    }

    List<Endors1CrudModel>? listItemEndors;
    if (data["listEndors"] != null) {
      listItemEndors = List<Endors1CrudModel>.from(
          data["listEndors"].map((e) => Endors1CrudModel.fromJson(e)));
    }

    List<DnCnModel>? listItemDnCn;
    if (data["listDnCn"] != null) {
      listItemDnCn = List<DnCnModel>.from(
          data["listDnCn"].map((e) => DnCnModel.fromJson(e)));
    }

    return Polis1CrudModel(
        coverNo: data['coverNo'] ?? "",
        cstPremi: double.parse(data['cstPremi'].toString()),
        insuredNama: data['insuredNama'] ?? "",
        periodeAkhir: DateTime.parse(data['periodeAkhir']),
        periodeAwal: DateTime.parse(data['periodeAwal']),
        placing1Id: data['placing1Id'],
        polisIssued: DateTime.tryParse(data['polisIssued']),
        polisNo: data['polisNo'] ?? "",
        polis1Id: data['polis1Id'] ?? "",
        tsi: double.parse(data['tsi'].toString()),
        cobNama: data['cobNama'] ?? "",
        curr: data['curr'] ?? "",
        listObj: listItemObj,
        listSecurity: listItemSecurity,
        listDoc: listItemDoc,
        listEndors: listItemEndors,
        listDnCn: listItemDnCn);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? listItemObj;
    if (listObj != null) {
      listItemObj = listObj!.map((e) => e.toJson()).toList();
    }

    List<Map<String, dynamic>> listItemSecurity =
        listSecurity.map((e) => e.toJson()).toList();

    List<Map<String, dynamic>>? listItemEndors;
    if (listEndors != null) {
      listItemEndors = listEndors!.map((e) => e.toJson()).toList();
    }

    List<Map<String, dynamic>>? listItemDnCn;
    if (listDnCn != null) {
      listItemDnCn = listDnCn!.map((e) => e.toJson()).toList();
    }

    List<Map<String, dynamic>>? listItemDoc;
    if (listDoc  
     != null) {
      listItemDoc = listDoc!.map((e) => e.toJson()).toList();
    }

    return {
      'coverNo': coverNo,
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
      'curr': curr,
      'listObj': listItemObj,
      'listSecurity': listItemSecurity,
      'listEndors': listItemEndors,
      'listDnCn': listItemDnCn,
      'listDoc': listItemDoc
    };
  }
}
