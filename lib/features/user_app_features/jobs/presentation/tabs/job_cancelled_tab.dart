import 'package:blue_collar_app/features/user_app_features/jobs/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class JobCancelledTab extends StatefulWidget {
  const JobCancelledTab({super.key});

  @override
  State<JobCancelledTab> createState() => _JobCancelledTabState();
}

class _JobCancelledTabState extends State<JobCancelledTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(10, (index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: JobCard(
            status: Status.cancelled,
          ),
        );
      })),
    );
  }
}
