part of 'personal_info_bloc.dart';

@immutable
sealed class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfilePictureEvent extends PersonalInfoEvent {
  const UpdateProfilePictureEvent({required this.image, required this.userId});
  final File image;
  final String userId;
}
