import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:unicons/unicons.dart';

enum Status { ongoing, done, cancelled }

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: Responsive.getSize(context).width,
      padding: UtilityClass.horizontalAndVerticalPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderGray)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Request sent"),
              Text("1h ago"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TimelineTile(
            indicatorStyle:
                IndicatorStyle(width: 30, color: AppColors.primaryColor),
            afterLineStyle: const LineStyle(thickness: 1),
            isFirst: true,
            alignment: TimelineAlign.start,
            endChild: Container(
              padding: UtilityClass.horizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hyefur Jonathan",
                    style: UtilityClass.blackRegular,
                  ),
                  Text(
                    "Software Development",
                    style: UtilityClass.tertiarySmall,
                  )
                ],
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle:
                IndicatorStyle(width: 30, color: AppColors.tertiaryColor),
            beforeLineStyle: const LineStyle(thickness: 1),
            isFirst: false,
            isLast: true,
            alignment: TimelineAlign.start,
            endChild: Container(
              alignment: Alignment.centerLeft,
              padding: UtilityClass.horizontalPadding,
              constraints: const BoxConstraints(
                minHeight: 100,
              ),
              child: Text(
                "You",
                style: UtilityClass.blackRegular,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Row(
                children: [
                  Icon(UniconsLine.tag),
                  SizedBox(
                    width: 10,
                  ),
                  Text("54")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Icon(UniconsLine.clock),
                  SizedBox(
                    width: 10,
                  ),
                  Text("54 mins")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Icon(UniconsLine.location_arrow),
                  SizedBox(
                    width: 10,
                  ),
                  Text("5km")
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Comment",
            style: TextStyle(fontSize: 14, color: AppColors.inactiveColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Call when you are nearby"),
          const SizedBox(
            height: 30,
          ),
          if (status == Status.ongoing)
            Center(
              child: Container(
                width: Responsive.getSize(context).width,
                decoration: UtilityClass.buttonDecorationFill,
                child: ElevatedButton(
                    onPressed: () {
                      context.push("/home/jobs/live-track");
                    },
                    child: const Text(
                      "View",
                      style: TextStyle(fontSize: 15),
                    )),
              ),
            ),
          if (status == Status.done)
            const Center(
                child: Text(
              "Job Completed",
              style: TextStyle(color: Colors.green),
            )),
          if (status == Status.cancelled)
            const Center(
                child: Text(
              "Job Cancelled",
              style: TextStyle(color: Colors.red),
            )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
