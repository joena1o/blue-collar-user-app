import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LabelAppBar extends StatelessWidget {
  const LabelAppBar(
      {super.key,
      required this.title,
      this.showBack = true,
      this.border = true});

  final String title;
  final bool border;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            border: border == false
                ? null
                : Border(
                    bottom:
                        BorderSide(color: Theme.of(context).highlightColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: showBack,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).highlightColor),
                        borderRadius: BorderRadius.circular(100)),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: showBack ? 45.0 : 0.00),
                child: Text(
                  title,
                  style: UtilityClass.blackRegular,
                ),
              ),
              Container()
            ],
          ),
        ));
  }
}
