import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        leading: IconButton(
          icon: const Icon(UniconsLine.angle_left_b,
              size: 34, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: ListView(
            padding: UtilityClass.horizontalPadding,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sign Up",
                style: UtilityClass.blackLargeHeader,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff4285F4),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(2),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white, // Circle background color
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Image(
                            image: AssetImage('assets/png/google.png'),
                            width: 24,
                            height: 24),
                      ),
                      const Spacer(),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        //textAlign: TextAlign.center
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // Line color
                      thickness: 1, // Line thickness
                      endIndent: 10, // Space between line and 'or'
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 16), // Text style
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // Line color
                      thickness: 1, // Line thickness
                      indent: 10, // Space between 'or' and line
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //Form Section
              TextFormField(
                decoration: const InputDecoration(hintText: "First name"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last name"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Password (8 or more characters)",
                    suffix: Icon(UniconsLine.eye_slash)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Confirm password",
                    suffix: Icon(UniconsLine.eye_slash)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "Referral code (Optional)"),
              ),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                width: Responsive.getSize(context).width,
                child: TextButton(
                  onPressed: () {},
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "By Continuing, you are agreeing to our ",
                        style: UtilityClass.blackSmaller,
                      ),
                      GestureDetector(
                        child: Text(
                          "Terms & Conditions ",
                          style: UtilityClass.tertiarySmall,
                        ),
                      ),
                      Text(
                        "including our ",
                        style: UtilityClass.blackSmaller,
                      ),
                      GestureDetector(
                        child: Text(
                          "Privacy Policy.",
                          style: UtilityClass.tertiarySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: Responsive.getSize(context).width,
                decoration: UtilityClass.buttonDecorationFill,
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/verify-email");
                  },
                  child: const Text("Create account"),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 40, top: 10),
                width: Responsive.getSize(context).width,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: UtilityClass.blackSmaller,
                      ),
                      GestureDetector(
                        child: Text(
                          "Log in",
                          style: UtilityClass.tertiarySmall,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
