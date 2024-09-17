import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ArtisanAboutTab extends StatefulWidget {
  const ArtisanAboutTab({super.key});

  @override
  State<ArtisanAboutTab> createState() => _ArtisanAboutTabState();
}

class _ArtisanAboutTabState extends State<ArtisanAboutTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: UtilityClass.horizontalPadding,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    radius: 28,
                    child: const Text("H"),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hyefur Jonathan",
                        style: UtilityClass.tertiaryRegular,
                      ),
                      const SizedBox(height: 3),
                      const Text("Software Development")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.borderGray,
                        child: const Icon(UniconsLine.calling),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.borderGray,
                        child: const Icon(UniconsLine.comment_message),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: const Text(
                "Software Engineer specializing in Flutter/Dart, Nodejs and Typescript with a comprehensive background in web and backend technologies. Skilled in designing, developing, and deploying software for Android, iOS, Web, and other platforms. Adept at collaborating effectively with cross-functional teams to create high-quality, scalable products."),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: Text(
              "Skills",
              style: UtilityClass.tertiaryRegular,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: Wrap(
                children: List.generate(6, (generator) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(right: 15, top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Barbing",
                  style: TextStyle(fontSize: 13),
                ),
              );
            })),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: Text(
              "Curriculum Vitae",
              style: UtilityClass.tertiaryRegular,
            ),
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: const Divider(),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: UtilityClass.horizontalPadding,
              decoration: BoxDecoration(
                  color: AppColors.tertiaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const ListTile(
                leading: Icon(
                  UniconsLine.file,
                  size: 30,
                ),
                title: Text("Hyefur_jonathan.pdf"),
                subtitle: Text("5 mb"),
                trailing: Icon(UniconsLine.eye),
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: Text(
              "Working Hours",
              style: UtilityClass.tertiaryRegular,
            ),
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: const Divider(),
          ),
          Padding(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: Column(
              children:
                  List.generate((UtilityClass.daysOfTheWeek.length), (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(UtilityClass.daysOfTheWeek[index]),
                      const Text("9:00am - 5:00pm")
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
