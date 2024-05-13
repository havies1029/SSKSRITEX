import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/widgets/list_extension.dart';
import 'package:ecargo_app/models/soaclient/dncncari_model.dart';
import 'package:ecargo_app/repositories/soaclient/dncncari_repository.dart';

part 'dncncari_event.dart';
part 'dncncari_state.dart';

class DncnCariBloc extends Bloc<DncnCariEvents, DncnCariState> {
	DncnCariBloc() : super(const DncnCariState()) {
		on<FetchDncnCariEvent>(onFetchDncnCari);
		on<RefreshDncnCariEvent>(onRefreshDncnCari);
	}

Future<void> onRefreshDncnCari(
		RefreshDncnCariEvent event, Emitter<DncnCariState> emit) async {
	emit(const DncnCariState());

	await Future.delayed(const Duration(seconds: 1));

	add(FetchDncnCariEvent(hal: 0, searchText: event.searchText));
}

Future<void> onFetchDncnCari(
		FetchDncnCariEvent event, Emitter<DncnCariState> emit) async {
	if (state.hasReachedMax) return;

	DncnCariRepository repo = DncnCariRepository();
	if (state.status == ListStatus.initial) {
		List<DncnCariModel> items = await repo.getDncnCari(event.searchText, 0);
		return emit(state.copyWith(
			items: items,
			hasReachedMax: false,
			status: ListStatus.success,
			hal: 1));
	}
	List<DncnCariModel> items = await repo.getDncnCari(event.searchText, state.hal);
	if (items.isEmpty) {
		return emit(state.copyWith(hasReachedMax: true));
	} else {
		List<DncnCariModel> dncnCari = List.of(state.items)..addAll(items);

		final result = dncnCari
			.whereWithIndex((e, index) =>
				dncnCari.indexWhere((e2) => e2.inv1Id == e.inv1Id) ==
				index)
			.toList();

		return emit(state.copyWith(
			items: result,
			hasReachedMax: false,
			status: ListStatus.success,
			hal: state.hal + 1));
		}

	}
}