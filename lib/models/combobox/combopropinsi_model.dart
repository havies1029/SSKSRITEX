import 'package:equatable/equatable.dart';

class ComboPropinsi extends Equatable {
  final String propinsiId;
  final String propinsiDesc;

  const ComboPropinsi({required this.propinsiId, required this.propinsiDesc});

  factory ComboPropinsi.fromJson(Map<String, dynamic> data) =>
      ComboPropinsi(propinsiId: data['propinsiId'], propinsiDesc: data['propinsiDesc']);

  Map<String, dynamic> toJson() =>
      {"propinsiId": propinsiId, "propinsiDesc": propinsiDesc};

  @override
  List<Object> get props => [propinsiId, propinsiDesc];

}
