import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/features/widgets/image_widget.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final auth = state as AuthLoadedState;
            return Column(
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
                      minLeadingWidth: 20,
                      horizontalTitleGap: 0,
                      leading: auth.user.picture.isEmpty
                          ? CircleAvatar(
                              backgroundColor: AppColors.tertiaryColor,
                              radius: 55,
                              child: const Icon(Icons.person),
                            )
                          : Container(
                              margin: UtilityClass.horizontalPadding,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  width: 55,
                                  height: 60,
                                  child: ImageWidget(
                                    url: auth.user.picture.toString(),
                                  ),
                                ),
                              ),
                            ),
                      title: Text(
                        "${auth.user.firstName} ${auth.user.lastName}",
                        style: const TextStyle(
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderGray)),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                      trailing: Icon(
                        Icons.keyboard_arrow_left,
                        size: 30,
                      ),
                    ),
                  ),
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
                    leading: Icon(Icons.lock),
                    title: Text("Privacy Policy"),
                    trailing: Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push("/home/invite-friends");
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
                      leading: Icon(Icons.person_add),
                      title: Text("Invite Friends"),
                      trailing: Icon(
                        Icons.keyboard_arrow_left,
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
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void customBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return Container(
            width: size.width,
            height: 300,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
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
