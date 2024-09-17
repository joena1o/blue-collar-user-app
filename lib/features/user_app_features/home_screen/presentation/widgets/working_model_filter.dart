import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class WorkFilter extends StatelessWidget {
  const WorkFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: Responsive.getSize(context).width,
      height: 50,
      child: Wrap(
        children: List.generate(UtilityClass.workingModel.length, (index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: index == 0 ? AppColors.primaryColor : Colors.white,
                border: Border.all(
                  color: AppColors.borderGray,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              UtilityClass.workingModel[index],
              style: TextStyle(
                color: index != 0 ? AppColors.primaryColor : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
