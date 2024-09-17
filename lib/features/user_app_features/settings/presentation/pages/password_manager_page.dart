import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class PasswordManagerPage extends StatefulWidget {
  const PasswordManagerPage({super.key});

  @override
  State<PasswordManagerPage> createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {
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
              const LabelAppBar(title: "Password Manager"),
              const SizedBox(height: 20),
              Padding(
                padding: UtilityClass.horizontalPadding,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Current Password"),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter your Current Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("New password"),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Enter your new password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Confirm Password"),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Confirm your password"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: UtilityClass.horizontalPadding,
            decoration: UtilityClass.buttonDecorationFill,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Update Password"),
            ),
          ),
        ));
  }
}
