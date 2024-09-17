import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          "assets/png/ob_1.png",
          width: 220,
          height: 220,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 55.0, right: 55.0, top: 55, bottom: 35),
          child: Text(
            "Find skilled specialists near you quickly and efficiently.",
            textAlign: TextAlign.center,
            style: UtilityClass.blackRegular,
          ),
        )
      ],
    );
  }
}
