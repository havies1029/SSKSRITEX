part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomePageActive extends HomeState {}

class ProfilePageActive extends HomeState {}

class RoomCariPageActive extends HomeState {}

class ChatSupportPageActive extends HomeState {}

class ClaimSupportPageActive extends HomeState {}

class CargoCariPageActive extends HomeState {}

class PolisCariPageActive extends HomeState {}

class PolisViewPageActive extends HomeState {
  final String polis1Id;
  const PolisViewPageActive({required this.polis1Id});
  @override
  List<Object> get props => [polis1Id];
}

class CargoInputPageActive extends HomeState {
  final String sppaId;
  final String viewMode;

  const CargoInputPageActive({required this.sppaId, required this.viewMode});

  @override
  List<Object> get props => [sppaId, viewMode];
}

class CargoBarangPageActive extends HomeState {
  final String barangId;
  final String viewMode;

  const CargoBarangPageActive({required this.barangId, required this.viewMode});

  @override
  List<Object> get props => [barangId, viewMode];
}

class ListMemberPageActive extends HomeState {}

class ListClaimPageActive extends HomeState {}

class DnCnCariPageActive extends HomeState {}