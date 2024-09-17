import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              context.push("/home/personal-info");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              margin: UtilityClass.horizontalPadding,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: AppColors.tertiaryColor,
                  radius: 55,
                  child: const Icon(UniconsLine.user),
                ),
                title: const Text(
                  "Hyefur Jonathan",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("View Profile",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              context.push("/home/settings");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColors.borderGray)),
              ),
              child: const ListTile(
                contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                leading: Icon(UniconsLine.setting),
                title: Text("Settings"),
                trailing: Icon(
                  UniconsLine.angle_right_b,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.borderGray)),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.only(bottom: 10, left: 15),
              leading: Icon(UniconsLine.lock),
              title: Text("Privacy Policy"),
              trailing: Icon(
                UniconsLine.angle_right_b,
                size: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push("/home/invite-friends");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColors.borderGray)),
              ),
              child: const ListTile(
                contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                leading: Icon(UniconsLine.user_plus),
                title: Text("Invite Friends"),
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
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColors.borderGray)),
              ),
              child: const ListTile(
                contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                leading: Icon(
                  UniconsLine.sign_out_alt,
                  color: Colors.red,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(
                  UniconsLine.angle_right_b,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
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
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "Logout",
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
                  "Are you sure you want to Logout",
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
                              context.go("/login");
                            },
                            child: const Text("Yes, Logout")),
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
