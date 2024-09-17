import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/create_profile/presentation/widgets/create_profile_about.dart';
import 'package:blue_collar_app/features/user_app_features/create_profile/presentation/widgets/create_profile_govt.dart';
import 'package:blue_collar_app/features/user_app_features/create_profile/presentation/widgets/create_profile_work.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class CreateProfileMain extends StatefulWidget {
  const CreateProfileMain({super.key});

  @override
  State<CreateProfileMain> createState() => _CreateProfileMainState();
}

class _CreateProfileMainState extends State<CreateProfileMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(
                UniconsLine.user_circle,
                size: 35,
              ),
            ),
            title: Text(
              "Create your profile",
              style: UtilityClass.blackMediumHeader,
            )),
        body: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  children: [
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: const CreateProfileAbout(),
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: const CreateProfileWork(),
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: const CreateProfileGovt(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: UtilityClass.horizontalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        UniconsLine.arrow_left,
                        size: 35,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        decoration: UtilityClass.buttonDecorationOnlyOutline,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go("/create-profile");
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(color: AppColors.secondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
