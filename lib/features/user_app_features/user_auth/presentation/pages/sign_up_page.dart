import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/services/auth_service.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unicons/unicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController referralCode = TextEditingController();

  String? emailText;

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    referralCode.dispose();
    super.dispose();
  }

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
        body: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadedState) {
                GoRouter.of(context).go('/verify-email',
                    extra: (email.text.isEmpty)
                        ? emailText
                        : email.text.toString());
              }
            },
            builder: (context, state) {
              return SizedBox(
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
                      GestureDetector(
                        onTap: () {
                          googleAuth().then((value) {
                            if (value != null) {
                              setState(() => emailText = value.email);
                              BlocProvider.of<AuthBloc>(context).add(
                                  SignUpEventManually(
                                      firstName:
                                          value.displayName!.split(" ").first,
                                      lastName:
                                          value.displayName!.split(" ").last,
                                      email: value.email,
                                      picture: value.photoUrl,
                                      password: value.id,
                                      referralCode: referralCode.text));
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff4285F4),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color:
                                      Colors.white, // Circle background color
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
                        controller: firstName,
                        validator: UtilityClass.firstNameValidator,
                        decoration:
                            const InputDecoration(hintText: "First name"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: lastName,
                        validator: UtilityClass.lastNameValidator,
                        decoration:
                            const InputDecoration(hintText: "Last name"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final RegExp regex =
                              RegExp(UtilityClass.emailPattern);
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: password,
                        validator: UtilityClass.passwordValidator,
                        obscureText: false,
                        decoration: const InputDecoration(
                            hintText: "Password (8 or more characters)",
                            suffix: Icon(UniconsLine.eye_slash)),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPassword,
                        validator: (String? e) {
                          if (e!.isEmpty) {
                            return "Please confirm your password";
                          } else if (e != password.text) {
                            return "Password do not match";
                          }
                          return null;
                        },
                        obscureText: false,
                        decoration: const InputDecoration(
                            hintText: "Confirm password",
                            suffix: Icon(UniconsLine.eye_slash)),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: referralCode,
                        decoration: const InputDecoration(
                            hintText: "Referral code (Optional)"),
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

                      state is AuthLoadingState
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              width: Responsive.getSize(context).width,
                              decoration: UtilityClass.buttonDecorationFill,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() => emailText = "");
                                  if (_formKey.currentState!.validate()) {
                                    if (password.text == confirmPassword.text) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                          SignUpEventManually(
                                              firstName: firstName.text,
                                              lastName: lastName.text,
                                              email: email.text,
                                              password: password.text,
                                              referralCode: referralCode.text));
                                    }
                                  }
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
                  ));
            },
          ),
        ));
  }

  Future<GoogleSignInAccount?> googleAuth() async {
    final GoogleSignInAccount? result = await AuthService.signInWithGoogle();
    return result;
  }
}
