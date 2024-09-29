part of 'personal_info_bloc.dart';

class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

final class PersonalInfoInitial extends PersonalInfoState {}

final class UpdatingPersonalInfo extends PersonalInfoState {}

final class UpdatingPersonalLoaded extends PersonalInfoState {
  const UpdatingPersonalLoaded({required this.user});
  final UserModel user;
  @override
  List<Object> get props => [user];
}

final class UpdatingPersonalInfoFailed extends PersonalInfoState {
  const UpdatingPersonalInfoFailed({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
