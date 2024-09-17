import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
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
                    const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                numberOfFields: 4,
                borderColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                fieldWidth: 75,
                filled: true,
                fillColor: Colors.grey[100]!,
                fieldHeight: 75,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
            ),
            const Spacer(),
            Container(
              margin: UtilityClass.horizontalPadding,
              //margin: const EdgeInsets.symmetric(vertical: 5),
              width: Responsive.getSize(context).width,
              decoration: UtilityClass.buttonDecorationFill,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/field-of-expertise");
                },
                child: const Text("Next"),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
