import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CreateProfileGovt extends StatefulWidget {
  const CreateProfileGovt({super.key});

  @override
  State<CreateProfileGovt> createState() => _CreateProfileGovtState();
}

class _CreateProfileGovtState extends State<CreateProfileGovt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "Add government ID",
          style: UtilityClass.blackSemiLargeHeader,
        ),
        Text(
          "Upload clear picture of the front and back of a government ID (NIN, Voters card)",
          style: UtilityClass.blackSmall,
        ),
        const Spacer(),
        Column(
          children: [
            Container(
              width: Responsive.getSize(context).width,
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: const Icon(
                UniconsLine.plus_circle,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: Responsive.getSize(context).width,
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: const Icon(
                UniconsLine.plus_circle,
                size: 40,
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
