import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          "assets/png/ob_2.png",
          width: 220,
          height: 220,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 55.0, right: 55.0, top: 55, bottom: 35),
          child: Text(
            "Have a skill? Provide services and expand your customer base.",
            textAlign: TextAlign.center,
            style: UtilityClass.blackRegular,
          ),
        )
      ],
    );
  }
}
