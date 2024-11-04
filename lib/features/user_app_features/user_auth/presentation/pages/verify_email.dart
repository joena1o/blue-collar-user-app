import 'dart:async';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailAddress extends StatefulWidget {
  const VerifyEmailAddress({super.key, required this.email});
  final String? email;

  @override
  State<VerifyEmailAddress> createState() => _VerifyEmailAddressState();
}

class _VerifyEmailAddressState extends State<VerifyEmailAddress> {
  bool isLoading = true;
  int timeLeft = 0;

  TextEditingController otpController = TextEditingController();
  String? code;

  @override
  void initState() {
    resetOtpTimer();
    BlocProvider.of<AuthBloc>(context).add(SendEmailOtp(email: widget.email!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: UtilityClass.horizontalPadding,
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            const Image(
              image: AssetImage(
                "assets/png/verify_email_img.png",
              ),
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Verify your email address",
              style: UtilityClass.blackSemiLargeHeader,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "A  verification mail has just been sent the email you provided. Click the link inside to get started.",
              textAlign: TextAlign.center,
              style: UtilityClass.blackRegular,
            ),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is EmailVerifiedState) {
                  context.go("/verify-phone");
                }
              },
              builder: (context, state) {
                return (state is AuthLoadingState)
                    ? Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator())
                    : Padding(
                        padding: UtilityClass.horizontalPadding,
                        child: OtpTextField(
                          showFieldAsBox: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          numberOfFields: 4,
                          borderColor: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          fieldWidth: 45,
                          fieldHeight: 50,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            BlocProvider.of<AuthBloc>(context).add(VerifyOtp(
                                otp: verificationCode, email: widget.email!));
                          }, // end onSubmit
                        ));
              },
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 40),
              width: Responsive.getSize(context).width,
              child: TextButton(
                onPressed: () {},
                child: Wrap(
                  children: [
                    Text(
                      "Didn't receive an email? ",
                      style: UtilityClass.blackSmaller,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (timeLeft == 0) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SendEmailOtp(email: widget.email!));
                          resetOtpTimer();
                        }
                      },
                      child: Text(
                        timeLeft != 0
                            ? "Click here in ( $timeLeft ) secs"
                            : "Click Here",
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

  late Timer _timer;

  resetOtpTimer() {
    setState(() => timeLeft = 30);
    setState(() => isLoading = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() => timeLeft--);
      } else {
        setState(() {
          isLoading = false;
          _timer.cancel();
        });
      }
    });
  }
}
