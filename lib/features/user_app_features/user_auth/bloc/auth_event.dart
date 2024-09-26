part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventWithGoogle extends AuthEvent {
  final String idToken;
  const SignUpEventWithGoogle({required this.idToken});
}

class SignUpEventManually extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? picture;
  final String? referralCode;
  const SignUpEventManually(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.picture,
      required this.referralCode});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  const SignInEvent({required this.email, required this.password});
}

class SendEmailOtp extends AuthEvent {
  final String email;
  const SendEmailOtp({required this.email});
}

class VerifyOtp extends AuthEvent {
  final String otp;
  const VerifyOtp({required this.otp});
}
