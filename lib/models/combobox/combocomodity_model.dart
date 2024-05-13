import 'package:equatable/equatable.dart';

class ComboComodity extends Equatable {
  final String comodityId;
  final String comodityName;

  const ComboComodity({required this.comodityId, required this.comodityName});

  factory ComboComodity.fromJson(Map<String, dynamic> data) =>
      ComboComodity(
        comodityId: data['comodityId'], 
        comodityName: data['comodityName']
      );

  Map<String, dynamic> toJson() =>
      {"comodityId": comodityId, "comodityName": comodityName};

  @override
  List<Object> get props => [comodityId, comodityName];

}