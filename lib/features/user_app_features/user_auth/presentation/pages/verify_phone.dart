import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: ListView(
          padding: UtilityClass.horizontalPadding,
          children: [
            const SizedBox(
              height: kToolbarHeight + 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Provide a Service",
                style: UtilityClass.blackSemiLargeHeader,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Image(
              image: AssetImage(
                "assets/png/rafiki.png",
              ),
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Verify your number",
              style: UtilityClass.blackSemiLargeHeader,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter phone number"),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
              child: Text(
                "We will send you a One Time Password on this mobile number",
                textAlign: TextAlign.center,
                style: UtilityClass.blackSmaller,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: Responsive.getSize(context).width,
              decoration: UtilityClass.buttonDecorationFill,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/verify-otp");
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
