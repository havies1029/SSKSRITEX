part of 'polisview_bloc.dart';

class PolisViewState extends Equatable {

	final bool isLoading;
  final bool isLoaded;
	final Polis1CrudModel? item;

	const PolisViewState(
		{ this.isLoading = false,
    this.isLoaded = false,
		this.item});

	PolisViewState copyWith(
		{Polis1CrudModel? item,
		isLoading,
		isLoaded}){
		return PolisViewState(
			item: item ?? this.item,
			isLoading: isLoading ?? this.isLoading,
			isLoaded: isLoaded ?? this.isLoaded);
	}

  @override
  List<Object> get props => [isLoading, isLoaded];

}
