part of 'poliscari_bloc.dart';

enum ListStatus { initial, success, failure }

class PolisCariState extends Equatable {
  final ListStatus status;
  final List<PolisCariModel> items;
  final bool hasReachedMax;
  final int hal;

  const PolisCariState(
      {this.status = ListStatus.initial,
      this.items = const <PolisCariModel>[],
      this.hasReachedMax = false,
      this.hal = 0});

  const PolisCariState.success(List<PolisCariModel> items)
      : this(status: ListStatus.success, items: items);

  const PolisCariState.failure() : this(status: ListStatus.failure);

  PolisCariState copyWith(
      {List<PolisCariModel>? items,
      bool? hasReachedMax,
      ListStatus? status,
      int? hal}) {
    debugPrint("PolisCariState -> copyWith -> $status");
    return PolisCariState(
        items: items ?? this.items,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status,
        hal: hal ?? this.hal);
  }

  @override
  List<Object> get props => [status, items, hasReachedMax, hal];
}
