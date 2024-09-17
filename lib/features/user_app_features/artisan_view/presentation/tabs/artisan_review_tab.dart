import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ArtisanReviewTab extends StatefulWidget {
  const ArtisanReviewTab({super.key});

  @override
  State<ArtisanReviewTab> createState() => _ArtisanReviewTabState();
}

class _ArtisanReviewTabState extends State<ArtisanReviewTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: Row(
            children: [
              Text(
                "Curriculum Vitae",
                style: UtilityClass.blackRegular,
              ),
              const Spacer(),
              const Icon(UniconsLine.edit_alt),
              const SizedBox(
                width: 5,
              ),
              Text(
                "add review",
                style: UtilityClass.tertiarySmall,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Expanded(
            child: Center(
          child: Text("No Reviews"),
        ))
      ],
    );
  }
}
