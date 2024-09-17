import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ExploreItemCard extends StatelessWidget {
  const ExploreItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.getSize(context).width,
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, int i) {
            return Container(
              width: Responsive.getSize(context).width * .83,
              height: Responsive.getSize(context).height * .22,
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        child: Text("A"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Software Developer",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text("Hyefur Jonathan"),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            UniconsLine.star,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5.0",
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 6),
                    child: Row(
                      children: [
                        Icon(
                          UniconsLine.money_bill,
                          size: 20,
                          color: AppColors.tertiaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text("Negotiable")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 6),
                    child: Row(
                      children: [
                        Icon(
                          UniconsLine.location_point,
                          size: 20,
                          color: AppColors.tertiaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text("New Jersey")
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: .5,
                    ),
                  ),
                  Wrap(
                    children: List.generate(3, (index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "Barbing",
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }),
                  )
                ],
              ),
            );
          }),
    );
  }
}
