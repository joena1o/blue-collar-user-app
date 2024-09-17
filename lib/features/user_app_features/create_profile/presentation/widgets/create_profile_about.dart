import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CreateProfileAbout extends StatefulWidget {
  const CreateProfileAbout({super.key});

  @override
  State<CreateProfileAbout> createState() => _CreateProfileAboutState();
}

class _CreateProfileAboutState extends State<CreateProfileAbout> {
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
          "Tell us about yourself",
          style: UtilityClass.blackSemiLargeHeader,
        ),
        Text(
          "Upload a clear personal picture",
          style: UtilityClass.blackSmall,
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: FittedBox(
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    UniconsLine.user_circle,
                    color: Color(0xff7DA5FF),
                    size: 170,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 30,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffC6C6C6),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      UniconsLine.camera,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Text(
          "Bio",
          style: UtilityClass.blackRegular,
        ),
        const TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Type in bio here..",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "Address",
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
