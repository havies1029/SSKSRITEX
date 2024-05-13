import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/widgets/list_extension.dart';
import 'package:ecargo_app/models/claim/claimcari_model.dart';
import 'package:ecargo_app/repositories/claim/claimcari_repository.dart';

part 'claimcari_event.dart';
part 'claimcari_state.dart';

class ClaimCariBloc extends Bloc<ClaimCariEvents, ClaimCariState> {
	ClaimCariBloc() : super(const ClaimCariState()) {
		on<FetchClaimCariEvent>(onFetchClaimCari);
		on<RefreshClaimCariEvent>(onRefreshClaimCari);
	}

Future<void> onRefreshClaimCari(
		RefreshClaimCariEvent event, Emitter<ClaimCariState> emit) async {
	emit(const ClaimCariState());

	await Future.delayed(const Duration(seconds: 1));

	add(FetchClaimCariEvent(hal: 0, searchText: event.searchText));
}

Future<void> onFetchClaimCari(
		FetchClaimCariEvent event, Emitter<ClaimCariState> emit) async {
	if (state.hasReachedMax) return;

	ClaimCariRepository repo = ClaimCariRepository();
	if (state.status == ListStatus.initial) {
		List<ClaimCariModel> items = await repo.getClaimCari(event.searchText, 0);
		return emit(state.copyWith(
			items: items,
			hasReachedMax: false,
			status: ListStatus.success,
			hal: 1));
	}
	List<ClaimCariModel> items = await repo.getClaimCari(event.searchText, state.hal);
	if (items.isEmpty) {
		return emit(state.copyWith(hasReachedMax: true));
	} else {
		List<ClaimCariModel> claimCari = List.of(state.items)..addAll(items);

		final result = claimCari
			.whereWithIndex((e, index) =>
				claimCari.indexWhere((e2) => e2.klaim1Id == e.klaim1Id) ==
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