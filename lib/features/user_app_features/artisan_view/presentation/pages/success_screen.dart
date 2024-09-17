import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Responsive.getSize(context).width,
      height: Responsive.getSize(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Lottie.asset('assets/lottie/success-lottie.json',
              repeat: false, width: 200, height: 200),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Request Sent",
            style: UtilityClass.blackMediumHeader,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Please wait for the service providers response"),
          const Spacer(),
          Container(
            width: Responsive.getSize(context).width,
            margin: UtilityClass.horizontalPadding,
            decoration: UtilityClass.buttonDecorationFill,
            child: ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("Continue")),
          ),
          const Spacer(),
        ],
      ),
    ));
  }
}
