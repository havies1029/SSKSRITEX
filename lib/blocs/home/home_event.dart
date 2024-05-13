part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomePageActiveEvent extends HomeEvent {}

class ProfilePageActiveEvent extends HomeEvent {}

class CargoCariPageActiveEvent extends HomeEvent {}

class PolisCariPageActiveEvent extends HomeEvent {}

class PolisViewPageActiveEvent extends HomeEvent {
  final String polis1Id;
  const PolisViewPageActiveEvent({required this.polis1Id});

  @override
  List<Object> get props => [polis1Id];
}

class CargoInputPageActiveEvent extends HomeEvent {
  final String sppaId;
  final String viewMode;

  const CargoInputPageActiveEvent(
      {required this.sppaId, required this.viewMode});

  @override
  List<Object> get props => [sppaId, viewMode];
}

class CargoBarangPageActiveEvent extends HomeEvent {
  final String barangId;
  final String viewMode;

  const CargoBarangPageActiveEvent(
      {required this.barangId, required this.viewMode});

  @override
  List<Object> get props => [barangId, viewMode];
}

class ListMemberPageActiveEvent extends HomeEvent {}

class RoomCariPageActiveEvent extends HomeEvent {}

class ChatSupportPageActiveEvent extends HomeEvent {}

class ClaimSupportPageActiveEvent extends HomeEvent {}

class ListClaimPageActiveEvent extends HomeEvent {}

class DnCnCariPageActiveEvent extends HomeEvent {}
