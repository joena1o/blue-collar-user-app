import 'dart:math';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class JobTab extends StatefulWidget {
  const JobTab({super.key});

  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(10, (index) {
        int value = Random().nextInt(2);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: JobCard(
            status: value == 0
                ? Status.ongoing
                : value == 1
                    ? Status.done
                    : Status.cancelled,
          ),
        );
      })),
    );
  }
}
