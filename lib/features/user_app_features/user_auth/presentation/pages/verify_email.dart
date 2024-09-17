import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailAddress extends StatefulWidget {
  const VerifyEmailAddress({super.key});

  @override
  State<VerifyEmailAddress> createState() => _VerifyEmailAddressState();
}

class _VerifyEmailAddressState extends State<VerifyEmailAddress> {
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
            const Spacer(),
            const Image(
              image: AssetImage(
                "assets/png/verify_email_img.png",
              ),
              width: 200,
              height: 200,
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
            const Spacer(),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 40),
              width: Responsive.getSize(context).width,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive an email? ",
                      style: UtilityClass.blackSmaller,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/verify-phone');
                      },
                      child: Text(
                        "Click Here",
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
