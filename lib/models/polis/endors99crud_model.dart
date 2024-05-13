class Endors99CrudModel {
  String endorsDesc;
  String endors1Id;  
  String valueNew;
  String valueOld;

  Endors99CrudModel(
      {required this.endorsDesc,
      required this.endors1Id,     
      required this.valueNew,
      required this.valueOld});

  factory Endors99CrudModel.fromJson(Map<String, dynamic> data) =>
      Endors99CrudModel(
          endorsDesc: data['endorsDesc'] ?? "",
          endors1Id: data['endors1Id'] ?? "",  
          valueNew: data['valueNew'] ?? "",
          valueOld: data['valueOld'] ?? "");

  Map<String, dynamic> toJson() => {
        'endorsDesc': endorsDesc,
        'endors1Id': endors1Id,
        'valueNew': valueNew,
        'valueOld': valueOld
      };
}
