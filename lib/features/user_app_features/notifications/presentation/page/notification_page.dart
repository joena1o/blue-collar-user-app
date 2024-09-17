import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/notifications/presentation/widgets/label_app_bar_with_badge.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelAppBarWithBadge(title: "Notification"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate((10), (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 10, left: 20, right: 20),
                            child: Text(
                              "Today",
                              style: UtilityClass.blackSmall,
                            ),
                          ),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppColors.borderGray)),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.tertiaryColor,
                                child: const Icon(
                                  UniconsLine.chat,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "You have a new message",
                                style: UtilityClass.tertiaryRegularBold,
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Lorem cnfbdjbfdjb v jfbvf jvfjv fv fj vf rjv fj",
                                ),
                              ),
                              trailing: Text(
                                "1h",
                                style: UtilityClass.blackSmall,
                              ),
                            )),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
