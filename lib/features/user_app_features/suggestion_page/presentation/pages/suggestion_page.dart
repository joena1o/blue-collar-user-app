import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Responsive.getSize(context).width,
      height: Responsive.getSize(context).height,
      child: Column(
        children: [
          const LabelAppBar(
            title: "Suggestion",
            border: false,
          ),
          Container(
              margin: UtilityClass.horizontalPadding,
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderGray),
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(UniconsLine.search),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: UtilityClass.tertiarySmall,
                          ),
                        )),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push("/home/filter-page");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        UniconsLine.sliders_v_alt,
                        color: AppColors.tertiaryColor,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
