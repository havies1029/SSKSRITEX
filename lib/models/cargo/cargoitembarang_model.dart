class CargoItemBarangModel {
  String? cargoItemId;
  int nourut;
  List<String> listDesc;
  String siCurr;
  double siAmount;
  String? urlFoto;

  CargoItemBarangModel(
      {this.cargoItemId,
      required this.nourut,
      required this.listDesc,
      required this.siCurr,
      required this.siAmount,
      this.urlFoto});
}
