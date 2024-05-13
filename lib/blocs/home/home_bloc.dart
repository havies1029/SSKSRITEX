import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomePageActive()) {
    on<HomePageActiveEvent>((event, emit) => emit(HomePageActive()));
    on<ProfilePageActiveEvent>((event, emit) => emit(ProfilePageActive()));
    on<CargoCariPageActiveEvent>(
      (event, emit) {
        emit(CargoCariPageActive());
      },
    );
    on<CargoInputPageActiveEvent>(
      (event, emit) => emit(
          CargoInputPageActive(sppaId: event.sppaId, viewMode: event.viewMode)),
    );
    on<CargoBarangPageActiveEvent>((event, emit) => emit(CargoBarangPageActive(
        barangId: event.barangId, viewMode: event.viewMode)));
    on<ListMemberPageActiveEvent>(
      (event, emit) => emit(ListMemberPageActive()),
    );
    on<PolisCariPageActiveEvent>(
      (event, emit) => emit(PolisCariPageActive()),
    );
    on<PolisViewPageActiveEvent>(
      (event, emit) => emit(PolisViewPageActive(polis1Id: event.polis1Id))
    );    
    on<RoomCariPageActiveEvent>(
      (event, emit) => emit(RoomCariPageActive())
    ); 
    on<ChatSupportPageActiveEvent>(
      (event, emit) => emit(ChatSupportPageActive())
    );    
    on<ClaimSupportPageActiveEvent>(
      (event, emit) => emit(ClaimSupportPageActive())
    );
    on<ListClaimPageActiveEvent>(
      (event, emit) => emit(ListClaimPageActive())
    );
    on<DnCnCariPageActiveEvent>(
      (event, emit) => emit(DnCnCariPageActive())
    );
  }
}
