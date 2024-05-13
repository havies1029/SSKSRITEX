part of 'dncncari_bloc.dart';

abstract class DncnCariEvents extends Equatable {
	const DncnCariEvents();

	@override
	List<Object> get props => [];
}

class FetchDncnCariEvent extends DncnCariEvents {
	final int hal;
	final String searchText;

	const FetchDncnCariEvent({required this.hal, required this.searchText});

	@override
	List<Object> get props => [hal, searchText];
}

class RefreshDncnCariEvent extends DncnCariEvents {
	final int hal;
	final String searchText;

	const RefreshDncnCariEvent({required this.hal, required this.searchText});

	@override
	List<Object> get props => [hal, searchText];
}

