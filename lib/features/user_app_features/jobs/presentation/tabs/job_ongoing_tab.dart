import 'package:blue_collar_app/features/user_app_features/jobs/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class JobOngoingTab extends StatefulWidget {
  const JobOngoingTab({super.key});

  @override
  State<JobOngoingTab> createState() => _JobOngoingTabState();
}

class _JobOngoingTabState extends State<JobOngoingTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(10, (index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: JobCard(
            status: Status.ongoing,
          ),
        );
      })),
    );
  }
}
