import 'dart:io';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/person_information/bloc/personal_info_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/features/widgets/image_widget.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              final auth = state as AuthLoadedState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelAppBar(title: "Personal Information"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          GestureDetector(
                            onTap: () {
                              customBottomSheet(context);
                            },
                            child: Center(
                                child: Stack(
                              children: [
                                auth.user.picture.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                          width: 140,
                                          height: 140,
                                          child: ImageWidget(
                                            url: auth.user.picture.toString(),
                                          ),
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 70,
                                        child: Icon(Icons.person),
                                      ),
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.primaryColor,
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ))
                              ],
                            )),
                          ),
                          Padding(
                            padding: UtilityClass.horizontalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text("Name"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      hintText:
                                          "${auth.user.firstName} ${auth.user.lastName}"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Phone Number"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: auth.user.profile.phone ?? "-"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Email Address"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      hintText: auth.user.email),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Gender"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  decoration: InputDecoration(hintText: "Male"),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void customBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
            listener: (context, state) {
              if (state is UpdatingPersonalLoaded) {
                BlocProvider.of<AuthBloc>(context)
                    .add(UpdateUserEvent(user: state.user));
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return (state is UpdatingPersonalInfo)
                  ? Container(
                      alignment: Alignment.center,
                      height: 250,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Updating your profile, please wait.."),
                          CircularProgressIndicator(),
                        ],
                      ))
                  : BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final authState = state as AuthLoadedState;
                        return SizedBox(
                          width: size.width,
                          height: 250,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final XFile? image = await picker.pickImage(
                                      source: ImageSource.camera);
                                  callBack(
                                      File(image!.path), authState.user.id);
                                },
                                child: Container(
                                  margin: UtilityClass.horizontalPadding,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(
                                        Icons.camera,
                                        size: 20,
                                      ),
                                    ),
                                    title: Text("Camera"),
                                  ),
                                ),
                              ),
                              Container(
                                padding: UtilityClass.horizontalPadding,
                                height: 20,
                                child: const Divider(),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  callBack(
                                      File(image!.path), authState.user.id);
                                },
                                child: Container(
                                  margin: UtilityClass.horizontalPadding,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(
                                        Icons.browse_gallery,
                                        size: 20,
                                      ),
                                    ),
                                    title: Text("Gallery"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      });
            },
          );
        });
  }

  void callBack(File file, String userId) {
    BlocProvider.of<PersonalInfoBloc>(context)
        .add(UpdateProfilePictureEvent(image: file, userId: userId));
  }
}
