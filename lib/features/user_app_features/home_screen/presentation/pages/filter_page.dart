import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/working_model_filter.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelAppBar(title: "Filter"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Location",
                        style: UtilityClass.blackRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: UtilityClass.horizontalPadding,
                      width: Responsive.getSize(context).width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Select Location"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Wage",
                        style: UtilityClass.blackRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: UtilityClass.horizontalPadding,
                      width: Responsive.getSize(context).width,
                      padding: const EdgeInsets.all(0),
                      child: SfRangeSlider(
                        min: 0.0,
                        max: 100.0,
                        values: _values,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (SfRangeValues values) {
                          setState(() {
                            _values = values;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Working Model",
                        style: UtilityClass.blackRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: const WorkFilter(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: UtilityClass.horizontalPadding,
                      child: Text(
                        "Job Type",
                        style: UtilityClass.blackRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: List.generate(
                            UtilityClass.artisanCategories.length, (index) {
                          return Row(
                            children: [
                              Checkbox(value: false, onChanged: (onChange) {}),
                              Text(
                                UtilityClass.artisanCategories[index],
                                style: UtilityClass.blackSmall,
                              )
                            ],
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: UtilityClass.buttonDecorationOnlyOutline,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Reset Filter",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: UtilityClass.buttonDecorationFill,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Apply",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
