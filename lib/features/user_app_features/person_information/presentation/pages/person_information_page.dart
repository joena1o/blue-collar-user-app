import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelAppBar(title: "Personal Information"),
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    child: Icon(UniconsLine.user),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(
                        UniconsLine.edit_alt,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: UtilityClass.horizontalPadding,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text("Name"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Hyefur Jonathan"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Phone Number"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "+2348149056513"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email Address"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(hintText: "jonathanhyefur@gmail.com"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Gender"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Male"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
