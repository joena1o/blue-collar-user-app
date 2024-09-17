import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:unicons/unicons.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: Responsive.getSize(context).width,
            height: Responsive.getSize(context).height,
            child: Column(
              children: [
                const LabelAppBar(title: "Settings"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: AppColors.borderGray)),
                  ),
                  child: const ListTile(
                    contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                    leading: Icon(UniconsLine.bell),
                    title: Text("Notification"),
                    trailing: Icon(
                      UniconsLine.angle_right_b,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/home/settings/password-manager');
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderGray)),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                      leading: Icon(UniconsLine.key_skeleton_alt),
                      title: Text("Password Manager"),
                      trailing: Icon(
                        UniconsLine.angle_right_b,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customBottomSheet(context);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderGray)),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                      leading: Icon(UniconsLine.trash, color: Colors.red),
                      title: Text("Delete Account",
                          style: TextStyle(color: Colors.red)),
                      trailing: Icon(
                        UniconsLine.angle_right_b,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  void customBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return Container(
            width: size.width,
            height: size.height * .3,
            padding: const EdgeInsets.all(10),
            //color: Colors.white,
            child: Column(
              children: [
                Text(
                  "Delete Account",
                  style: UtilityClass.blackRegular,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: UtilityClass.horizontalPadding,
                  child: const Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Are you sure you want to delete your account",
                  textAlign: TextAlign.center,
                  style: UtilityClass.blackRegular,
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: UtilityClass.buttonDecorationOnlyOutline,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: UtilityClass.buttonDecorationFill,
                        child: ElevatedButton(
                            onPressed: () {
                              context.go("/");
                            },
                            child: const Text("Yes")),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }
}
