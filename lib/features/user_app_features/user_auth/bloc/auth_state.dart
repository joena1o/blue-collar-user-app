part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  const AuthLoadedState({required this.user});
  final UserModel user;
  @override
  List<Object> get props => [user];
}

class AuthFailedState extends AuthState {
  const AuthFailedState({required this.errorMessage});
  final String errorMessage;
}

class OtpRequestSentState extends AuthState {
  const OtpRequestSentState({required this.message});
  final MessageResponse message;
}

class EmailVerifiedState extends AuthState {
  const EmailVerifiedState({required this.message});
  final MessageResponse message;
}
