import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
              margin: UtilityClass.horizontalPadding,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              padding: const EdgeInsets.only(top: 20, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderGray),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(UniconsLine.search),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          "Search here",
                          style: UtilityClass.blackSmall,
                        )),
                      ],
                    ),
                  )),
                ],
              )),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.borderGray)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        leading: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              child: Text("H"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          ],
                        ),
                        title: const Text("Hyefur Jonathan"),
                        subtitle: const Text("Perfect, i will check it out"),
                        trailing: Text(
                          '09:00AM',
                          style: UtilityClass.tertiarySmall,
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
