import 'dart:io';
import 'package:blue_collar_app/core/config/get_it_setup.dart';
import 'package:blue_collar_app/data/data_provider.dart';
import 'package:blue_collar_app/features/user_app_features/person_information/data/personal_info_repository.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/user_model.dart';
import 'package:blue_collar_app/helper/exception_handler.dart';
import 'package:blue_collar_app/utils/dialog_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'personal_info_event.dart';
part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc({required PersonalInfoRepository personalInfoRepository})
      : super(PersonalInfoInitial()) {
    on<UpdateProfilePictureEvent>((UpdateProfilePictureEvent event,
        Emitter<PersonalInfoState> emit) async {
      emit(UpdatingPersonalInfo());
      try {
        final imageUrl = await DataProvider.uploadImage(File(event.image.path));
        final user = await PersonalInfoRepository.updateProfile(
            {"imageUrl": imageUrl[0]['url'], "id": event.userId});
        emit(UpdatingPersonalLoaded(user: user));
        getIt<DialogServices>()
            .showMessageError("Profile Updated successfully");
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(UpdatingPersonalInfoFailed(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
