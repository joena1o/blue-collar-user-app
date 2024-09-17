import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CreateProfileWork extends StatefulWidget {
  const CreateProfileWork({super.key});

  @override
  State<CreateProfileWork> createState() => _CreateProfileWorkState();
}

class _CreateProfileWorkState extends State<CreateProfileWork> {
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
          "Add pictures of your work",
          style: UtilityClass.blackSemiLargeHeader,
        ),
        Text(
          "Upload a clear work pictures",
          style: UtilityClass.blackSmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 25,
                    childAspectRatio: Responsive.getSize(context).width / 350),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: const Icon(
                        UniconsLine.plus_circle,
                        size: 40,
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
