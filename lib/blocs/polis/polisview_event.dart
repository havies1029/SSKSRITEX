part of 'polisview_bloc.dart';

abstract class PolisViewEvents extends Equatable {
	const PolisViewEvents();

	@override
	List<Object> get props => [];
}

class GetPolisViewEvent extends PolisViewEvents {	
	final String polis1Id;

	const GetPolisViewEvent({required this.polis1Id});

	@override
	List<Object> get props => [polis1Id];
}

class ResetStatePolisViewEvent extends PolisViewEvents {}
