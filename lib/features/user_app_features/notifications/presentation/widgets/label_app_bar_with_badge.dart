import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LabelAppBarWithBadge extends StatelessWidget {
  const LabelAppBarWithBadge({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderGray)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGray),
                    borderRadius: BorderRadius.circular(100)),
                width: 40,
                height: 40,
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Text(
                title,
                style: UtilityClass.blackRegular,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.tertiaryColor,
              ),
              child: const Text(
                "2 New",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
