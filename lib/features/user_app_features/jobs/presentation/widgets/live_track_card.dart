import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:unicons/unicons.dart';

class LiveTrackCard extends StatelessWidget {
  const LiveTrackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.getSize(context).width,
      padding: UtilityClass.horizontalAndVerticalPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border(top: BorderSide(color: AppColors.borderGray))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimelineTile(
            isLast: true,
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
          const SizedBox(
            height: 30,
          ),
          const Row(
            children: [
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
            height: 10,
          ),
        ],
      ),
    );
  }
}
