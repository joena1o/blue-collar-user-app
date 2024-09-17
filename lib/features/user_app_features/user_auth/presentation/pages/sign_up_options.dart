import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class SignUpOptionPage extends StatefulWidget {
  const SignUpOptionPage({super.key});

  @override
  State<SignUpOptionPage> createState() => _SignUpOptionPageState();
}

class _SignUpOptionPageState extends State<SignUpOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        leading: IconButton(
          icon: const Icon(UniconsLine.angle_left_b,
              size: 34, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: UtilityClass.horizontalPadding,
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: Text(
                "Provide Services?",
                style: UtilityClass.blackLargeHeader,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "Have a skill? sign up with us today. Provide services for millions of customers and tap into unlimited opportunities",
                style: UtilityClass.blackRegular,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: Responsive.getSize(context).width,
              decoration: UtilityClass.buttonDecorationFill,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/sign-up");
                },
                child: const Text("Sign Up"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: Text(
                "Find service providers",
                style: UtilityClass.blackLargeHeader,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "Sign up with us today and connect to service providers near you and never worry about an issue again.",
                style: UtilityClass.blackRegular,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: Responsive.getSize(context).width,
              decoration: UtilityClass.buttonDecorationFill,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/sign-up");
                },
                child: const Text("Sign Up"),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              width: Responsive.getSize(context).width,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Are you a professional? ",
                      style: UtilityClass.blackSmaller,
                    ),
                    GestureDetector(
                      child: Text(
                        "Register as a professional",
                        style: UtilityClass.tertiarySmall,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
