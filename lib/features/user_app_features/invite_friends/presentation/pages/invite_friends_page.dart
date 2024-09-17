import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';

class InviteFriendsPage extends StatefulWidget {
  const InviteFriendsPage({super.key});

  @override
  State<InviteFriendsPage> createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Responsive.getSize(context).width,
      height: Responsive.getSize(context).height,
      child: Column(
        children: [
          const LabelAppBar(title: "Invite Friends"),
          Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).highlightColor)),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          radius: 30,
                          child: Text(""),
                        ),
                        title: const Text("Carla Schoen"),
                        subtitle: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text("08149056513"),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: UtilityClass.buttonDecorationFill,
                          child: const Text(
                            "Invite",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    ));
  }
}
