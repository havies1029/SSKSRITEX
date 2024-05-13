part of 'dncncari_bloc.dart';

enum ListStatus { initial, success, failure }

class DncnCariState extends Equatable {

	final ListStatus status;
	final List<DncnCariModel> items;
	final bool hasReachedMax;
	final int hal;

	const DncnCariState(
		{this.status = ListStatus.initial,
		this.items = const <DncnCariModel>[],
		this.hasReachedMax = false,
		this.hal = 0});

	const DncnCariState.success(List<DncnCariModel> items)
			: this(status: ListStatus.success, items: items);

	const DncnCariState.failure() : this(status: ListStatus.failure);

	DncnCariState copyWith(
		{List<DncnCariModel>? items,
		bool? hasReachedMax,
		ListStatus? status,
		int? hal}){
		return DncnCariState(
			items: items ?? this.items,
			hasReachedMax: hasReachedMax ?? this.hasReachedMax,
			status: status ?? this.status,
			hal: hal ?? this.hal);
	}

	@override
	List<Object> get props => [status, items, hasReachedMax, hal];
}
