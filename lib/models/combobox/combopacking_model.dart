import 'package:equatable/equatable.dart';

class ComboPacking extends Equatable {
  final String packingId;
  final String packingName;

  const ComboPacking({required this.packingId, required this.packingName});

  factory ComboPacking.fromJson(Map<String, dynamic> data) =>
      ComboPacking(packingId: data['packingId'], packingName: data['packingName']);

  Map<String, dynamic> toJson() =>
      {"packingId": packingId, "packingName": packingName};

  @override
  List<Object> get props => [packingId, packingName];

}