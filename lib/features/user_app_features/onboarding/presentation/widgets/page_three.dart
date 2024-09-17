import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          "assets/png/ob_3.png",
          width: 220,
          height: 220,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 45.0, right: 45.0, top: 55, bottom: 35),
          child: Text(
            "Get your essential needs provided immediately or on a scheduled date.",
            textAlign: TextAlign.center,
            style: UtilityClass.blackRegular,
          ),
        )
      ],
    );
  }
}
