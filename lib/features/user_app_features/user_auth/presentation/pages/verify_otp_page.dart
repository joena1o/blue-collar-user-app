import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/core/config/get_it_setup.dart';
import 'package:blue_collar_app/utils/dialog_services.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.phone, required this.pinId});

  final String phone;
  final String pinId;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  bool isLoading = true;
  int timeLeft = 30;

  TextEditingController pinCode = TextEditingController();
  String? code;

  @override
  void initState() {
    resetOtpTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left,
              size: 34, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight + 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Please enter OTP",
                style: UtilityClass.blackSemiLargeHeader,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: UtilityClass.horizontalPadding,
                margin: const EdgeInsets.only(bottom: 30),
                width: Responsive.getSize(context).width,
                child: RichText(
                  text: TextSpan(
                    text: 'A 4-digit verification code has been sent to ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 16.0,
                        height: 1.5),
                    children: [
                      TextSpan(
                        text: '+2348135672839',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //launchPhone('+2348135672839');
                          },
                      ),
                    ],
                  ),
                )),
            Container(
              padding: UtilityClass.horizontalPadding,
              child: OtpTextField(
                showFieldAsBox: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                numberOfFields: 4,
                borderColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                fieldWidth: 55,
                fieldHeight: 65,
                onCodeChanged: (String code) {
                  setState(() {
                    this.code = code;
                  });
                },
                onSubmit: (String verificationCode) {
                  if (verificationCode.isEmpty) {
                    getIt<DialogServices>()
                        .showMessageError("Please enter pin code");
                    return;
                  }
                  BlocProvider.of<AuthBloc>(context).add(VerifyOtpPhone(
                      pinId: widget.pinId, pin: verificationCode));
                }, // end onSubmit
              ),
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
                      "Didn't receive sms? ",
                      style: UtilityClass.blackSmaller,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (timeLeft == 0) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SendPhoneOtp(phone: widget.phone));
                          resetOtpTimer();
                        }
                      },
                      child: Text(
                        timeLeft != 0
                            ? "Click here in ( $timeLeft ) secs"
                            : "Click Here to resend",
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
