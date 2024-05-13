import 'package:ecargo_app/models/polis/endors99crud_model.dart';

class Endors1CrudModel {
  DateTime endorsTgl;
  String endors1Id;
  String polis1Id;
  double cstPremi;
  List<Endors99CrudModel>? listChanges;

  Endors1CrudModel(
      {required this.endorsTgl,
      required this.endors1Id,
      required this.polis1Id,
      required this.cstPremi,
      this.listChanges});

  factory Endors1CrudModel.fromJson(Map<String, dynamic> data) {
    List<Endors99CrudModel>? listItemChanges;
    if (data["listChanges"] != null) {
      listItemChanges = List<Endors99CrudModel>.from(
          data["listChanges"].map((e) => Endors99CrudModel.fromJson(e)));
    }

    return Endors1CrudModel(
        endorsTgl: DateTime.parse(data['endorsTgl']),
        endors1Id: data['endors1Id'] ?? "",
        polis1Id: data['polis1Id'] ?? "",
        cstPremi: double.parse(data['cstPremi'].toString()),
        listChanges: listItemChanges);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? listItemChanges;
    if (listChanges != null) {
      listItemChanges = listChanges!.map((e) => e.toJson()).toList();
    }

    return {
      'endorsTgl': endorsTgl.toIso8601String(),
      'endors1Id': endors1Id,
      'polis1Id': polis1Id,
      'listChanges': listItemChanges
    };
  }
}
