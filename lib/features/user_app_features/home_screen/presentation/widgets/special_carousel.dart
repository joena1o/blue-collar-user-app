import 'package:flutter/material.dart';

class SpecialCarousel extends StatelessWidget {
  const SpecialCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List specials = ["special-1.jpeg", "special-2.jpeg", "special-3.jpeg"];
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      width: size.width,
      height: size.height * .22,
      child: ListView.builder(
        itemCount: specials.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, i) {
          return Container(
            width: size.width * .78,
            height: size.height * .22,
            margin: const EdgeInsets.only(left: 15),
            child: Stack(
              children: [
                SizedBox(
                  width: size.width * .78,
                  height: size.height * .22,
                ),
                Positioned(
                    top: 0,
                    child: Opacity(
                        opacity: .3,
                        child: Container(
                            width: size.width * .78,
                            height: size.height * .22,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20))))),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: const Text(
                        "Limited Time!",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
