import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class LabelAppBar extends StatelessWidget {
  const LabelAppBar({super.key, required this.title, this.border = true});

  final String title;
  final border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: kToolbarHeight),
      decoration: BoxDecoration(
        border: border == false
            ? null
            : Border(bottom: BorderSide(color: AppColors.borderGray)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderGray),
                borderRadius: BorderRadius.circular(100)),
            width: 40,
            height: 40,
            child: const Icon(UniconsLine.arrow_left),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Text(
              title,
              style: UtilityClass.blackRegular,
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
