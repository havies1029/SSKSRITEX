part of 'claimcari_bloc.dart';

enum ListStatus { initial, success, failure }

class ClaimCariState extends Equatable {

	final ListStatus status;
	final List<ClaimCariModel> items;
	final bool hasReachedMax;
	final int hal;

	const ClaimCariState(
		{this.status = ListStatus.initial,
		this.items = const <ClaimCariModel>[],
		this.hasReachedMax = false,
		this.hal = 0});

	const ClaimCariState.success(List<ClaimCariModel> items)
			: this(status: ListStatus.success, items: items);

	const ClaimCariState.failure() : this(status: ListStatus.failure);

	ClaimCariState copyWith(
		{List<ClaimCariModel>? items,
		bool? hasReachedMax,
		ListStatus? status,
		int? hal}){
		return ClaimCariState(
			items: items ?? this.items,
			hasReachedMax: hasReachedMax ?? this.hasReachedMax,
			status: status ?? this.status,
			hal: hal ?? this.hal);
	}

	@override
	List<Object> get props => [status, items, hasReachedMax, hal];
}
