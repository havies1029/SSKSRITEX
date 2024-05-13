import 'package:ecargo_app/models/polis/polis1crud_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/repositories/polis/polisview_repository.dart';

part 'polisview_event.dart';
part 'polisview_state.dart';

class PolisViewBloc extends Bloc<PolisViewEvents, PolisViewState> {
  PolisViewBloc() : super(const PolisViewState()) {
    on<GetPolisViewEvent>(onGetPolisView);
  }

  Future<void> onGetPolisView(
      GetPolisViewEvent event, Emitter<PolisViewState> emit) async {

    debugPrint("onGetPolisView");

    emit(const PolisViewState());

    Polis1CrudModel item =
        await PolisViewRepository().getPolisView(event.polis1Id);

    //debugPrint("items count : ${item.toJson().toString()}");

    emit(state.copyWith(item: item, isLoaded: true, isLoading: false));
  }
}
