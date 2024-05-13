import 'package:equatable/equatable.dart';

class ComboConveyByModel extends Equatable {
	final String conveyBy;
	final String jpsMapId;
	final String mconveybyId;
	final String mopId;

	const ComboConveyByModel({required this.conveyBy, required this.jpsMapId, required this.mconveybyId, required this.mopId});

	factory ComboConveyByModel.fromJson(Map<String, dynamic> data) =>
		ComboConveyByModel(
			conveyBy: data['conveyBy'],
			jpsMapId: data['jpsMapId'],
			mconveybyId: data['mconveybyId'],
			mopId: data['mopId']
		);

	Map<String, dynamic> toJson() =>
		{'conveyBy': conveyBy,
		'jpsMapId': jpsMapId,
		'mconveybyId': mconveybyId,
		'mopId': mopId};

	@override
	List<Object> get props => [conveyBy, jpsMapId, mconveybyId, mopId];
}
