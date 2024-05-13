import 'package:equatable/equatable.dart';

class ComboJabatan extends Equatable {
  final String jabatanId;
  final String jabatanDesc;

  const ComboJabatan({required this.jabatanId, required this.jabatanDesc});

  factory ComboJabatan.fromJson(Map<String, dynamic> data) =>
      ComboJabatan(jabatanId: data['jabatanId'], jabatanDesc: data['jabatanDesc']);

  Map<String, dynamic> toJson() =>
      {"jabatanId": jabatanId, "jabatanDesc": jabatanDesc};

  @override
  List<Object> get props => [jabatanId, jabatanDesc];

}