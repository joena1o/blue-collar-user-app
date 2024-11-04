import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class TabAppBar extends StatelessWidget {
  const TabAppBar(
      {super.key,
      required this.title,
      required this.callback,
      this.showBack = true,
      this.border = true});

  final String title;
  final bool border;
  final bool showBack;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/background/top_section.png")),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: UtilityClass.whiteLargeHeader,
            ),
          ],
        ),
      ),
    );
  }
}
