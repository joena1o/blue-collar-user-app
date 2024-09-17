import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/tabs/job_cancelled_tab.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/tabs/job_done_tab.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/tabs/job_ongoing_tab.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/tabs/job_tab.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 4,
            child: SizedBox(
              width: Responsive.getSize(context).width,
              height: Responsive.getSize(context).height,
              child: Column(
                children: [
                  const LabelAppBar(
                    title: "Jobs",
                    border: false,
                  ),
                  TabBar(
                    indicatorWeight: 3,
                    indicatorColor: AppColors.primaryColor,
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: "Ongoing"),
                      Tab(
                        text: "Done",
                      ),
                      Tab(
                        text: "Cancelled",
                      )
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        JobTab(),
                        JobOngoingTab(),
                        JobDoneTab(),
                        JobCancelledTab()
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
