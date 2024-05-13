part of 'claimcari_bloc.dart';

abstract class ClaimCariEvents extends Equatable {
	const ClaimCariEvents();

	@override
	List<Object> get props => [];
}

class FetchClaimCariEvent extends ClaimCariEvents {
	final int hal;
	final String searchText;

	const FetchClaimCariEvent({required this.hal, required this.searchText});

	@override
	List<Object> get props => [hal, searchText];
}

class RefreshClaimCariEvent extends ClaimCariEvents {
	final int hal;
	final String searchText;

	const RefreshClaimCariEvent({required this.hal, required this.searchText});

	@override
	List<Object> get props => [hal, searchText];
}

