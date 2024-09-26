import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/services/auth_service.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoadedState) {
                  GoRouter.of(context).go('/home');
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: Responsive.getSize(context).width,
                  height: Responsive.getSize(context).height,
                  child: ListView(
                    padding: UtilityClass.horizontalPadding,
                    children: [
                      SizedBox(
                        height: Responsive.getSize(context).height * .15,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: 200,
                          child: Text("Welcome Back!",
                              style: UtilityClass.blackLargeHeader)),
                      const SizedBox(
                        height: 40,
                      ),
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
                        decoration: const InputDecoration(
                            hintText: "Username or Email"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        validator: (String? e) {
                          if (e!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                      (state is AuthLoadingState)
                          ? Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              child: const CircularProgressIndicator())
                          : Container(
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              width: Responsive.getSize(context).width,
                              decoration: UtilityClass.buttonDecorationFill,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                        SignInEvent(
                                            email: email.text,
                                            password: password.text));
                                  }
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
                      GestureDetector(
                        onTap: () {
                          googleAuth().then((value) {
                            if (value != null) {
                              BlocProvider.of<AuthBloc>(context).add(
                                  SignInEvent(
                                      email: value.email, password: value.id));
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
                      Container(
                          width: Responsive.getSize(context).width,
                          decoration: UtilityClass.buttonDecorationOnlyOutline,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push("/sign-up");
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16)),
                          )),
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
                );
              },
            )));
  }

  Future<GoogleSignInAccount?> googleAuth() async {
    final GoogleSignInAccount? result = await AuthService.signInWithGoogle();
    return result;
  }
}
