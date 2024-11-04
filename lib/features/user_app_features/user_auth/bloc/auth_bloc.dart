import 'dart:io';
import 'package:blue_collar_app/core/config/get_it_setup.dart';
import 'package:blue_collar_app/data/local_storage.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/otp_request_model.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/user_model.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/verified_response_model.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/repository/auth_repository.dart';
import 'package:blue_collar_app/helper/exception_handler.dart';
import 'package:blue_collar_app/helper/success_handler.dart';
import 'package:blue_collar_app/utils/dialog_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignUpEventManually>(
        (SignUpEventManually event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.signUpManually({
          "firstName": event.firstName,
          "lastName": event.lastName,
          "email": event.email,
          "password": event.password,
          "picture": event.picture,
          "referralCode": event.referralCode
        });
        emit(AuthLoadedState(user: user));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<SignInEvent>((SignInEvent event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository
            .signIn({"email": event.email, "password": event.password});
        SharedPrefService.saveItem("password", event.password);
        SharedPrefService.saveItem("email", event.email);
        emit(AuthLoadedState(user: user));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<UpdateUserEvent>((UpdateUserEvent event, Emitter<AuthState> emit) {
      emit(AuthLoadedState(user: event.user));
    });

    on<SendEmailOtp>((SendEmailOtp event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        MessageResponse response =
            await authRepository.requestEmailOtp({"email": event.email});
        emit(OtpRequestSentState(message: response));
        getIt<DialogServices>().showMessage(response.message);
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<VerifyOtp>((VerifyOtp event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        MessageResponse response = await authRepository
            .verifyEmailOtp({"otp": event.otp, "email": event.email});
        emit(EmailVerifiedState(message: response));
        getIt<DialogServices>().showMessage(response.message);
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<SendPhoneOtp>((SendPhoneOtp event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        OtpRequestModel response =
            await authRepository.requestPhoneOtp({"phone": event.phone});
        emit(OtpRequestPhoneSentState(otpRequestModel: response));
        getIt<DialogServices>().showMessage(response.message);
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<VerifyOtpPhone>((VerifyOtpPhone event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        VerifiedResponseModel response = await authRepository
            .verifyPhoneOtp({"pin": event.pin, "pinId": event.pinId});
        emit(OtpVerifiedState(verifiedResponseModel: response));
        getIt<DialogServices>().showMessage(response.message);
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
