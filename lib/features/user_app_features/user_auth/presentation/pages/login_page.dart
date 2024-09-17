import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Padding(
          padding: UtilityClass.horizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: 200,
                  child: Text("Welcome Back!",
                      style: UtilityClass.blackLargeHeader)),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "Username or Email"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                width: Responsive.getSize(context).width,
                decoration: UtilityClass.buttonDecorationFill,
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/home");
                  },
                  child: const Text("Login"),
                ),
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
              const SizedBox(
                height: 40,
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
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: Responsive.getSize(context).width,
                  decoration: UtilityClass.buttonDecorationOnlyOutline,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go("/sign-up-option");
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: AppColors.secondaryColor, fontSize: 16)),
                  )),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: Responsive.getSize(context).width,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgotten Password?"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
