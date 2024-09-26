import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    int active = 0;

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: size.width,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: UtilityClass.artisanCategories.length,
          itemBuilder: (BuildContext ctx, i) {
            return Padding(
                padding: EdgeInsets.only(left: i == 0 ? 20 : 10),
                child: ActionChip(
                    surfaceTintColor: AppColors.primaryColor,
                    onPressed: active == i ? () {} : null,
                    disabledColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundColor: AppColors.primaryColor,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    label: Text(
                      UtilityClass.artisanCategories[i],
                      style: TextStyle(
                          fontSize: 14,
                          color: active == i ? Colors.white : null),
                    )));
          }),
    );
  }
}
