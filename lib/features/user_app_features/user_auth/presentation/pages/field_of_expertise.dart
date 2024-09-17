import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class FieldOfExpertise extends StatefulWidget {
  const FieldOfExpertise({super.key});

  @override
  State<FieldOfExpertise> createState() => _FieldOfExpertiseState();
}

class _FieldOfExpertiseState extends State<FieldOfExpertise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: UtilityClass.horizontalPadding,
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          children: [
            Text(
              "Select your field of expertise",
              style: UtilityClass.blackLargeHeader,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderGray),
                  borderRadius: BorderRadius.circular(15)),
              width: Responsive.getSize(context).width,
              height: 50,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: 56.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Icon(UniconsLine.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext ctx, i) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      title: Text(
                        "AC/Refrigerator Services",
                        style: UtilityClass.blackRegular,
                      ),
                      trailing: Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                decoration: UtilityClass.buttonDecorationOnlyOutline,
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/create-profile");
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: AppColors.secondaryColor),
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
