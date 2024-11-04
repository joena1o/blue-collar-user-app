import 'dart:io';
import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/bookmark.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/chat_page.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/profile_tab.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/category_carousel.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/item_card.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/special_carousel.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/tab_app_bar_widget.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              if (i == 0)
                Column(
                  children: [
                    const AppBarWidget(),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15, top: 15),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/background/bottom_section.png")),
                      ),
                    ),
                  ],
                ),
              if (i == 1)
                TabAppBar(
                  title: "Bookmark",
                  callback: () {},
                ),
              if (i == 2)
                TabAppBar(
                  title: "Chat",
                  callback: () {},
                ),
              if (i == 3)
                TabAppBar(
                  title: "Profile",
                  callback: () {},
                ),

              i == 0
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: UtilityClass.horizontalPadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Suggested for you",
                                    style: UtilityClass.blackRegular,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.push("/home/suggestion");
                                    },
                                    child: Text(
                                      "See All",
                                      style: UtilityClass.tertiarySmall,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SpecialCarousel(),
                            const SizedBox(
                              height: 10,
                            ),
                            const CategoryCarousel(),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(10, (index) {
                                return GestureDetector(
                                    onTap: () {
                                      context.push("/home/artisan");
                                    },
                                    child: const ItemCard());
                              }),
                            )
                          ],
                        ),
                      ),
                    )
                  : i == 1
                      ? const BookmarkPage()
                      : i == 2
                          ? const ChatTab()
                          : const ProfileTab(),

              //Bottom AppBar
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Theme.of(context).highlightColor,
                            width: 1))),
                padding: EdgeInsets.only(
                    top: 15,
                    left: 25,
                    right: 25,
                    bottom: Platform.isAndroid ? 15 : 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 0);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: i == 0
                                ? AppColors.tertiaryColor
                                : AppColors.inactiveColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 13,
                              color: i == 0
                                  ? AppColors.tertiaryColor
                                  : AppColors.inactiveColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() => i = 1);
                    //   },
                    //   child: Column(
                    //     children: [
                    //       Icon(
                    //         UniconsLine.globe,
                    //         color: i == 1
                    //             ? AppColors.tertiaryColor
                    //             : AppColors.inactiveColor,
                    //       ),
                    //       const SizedBox(
                    //         height: 5,
                    //       ),
                    //       Text(
                    //         "Explore",
                    //         style: TextStyle(
                    //           fontSize: 13,
                    //           color: i == 1
                    //               ? AppColors.tertiaryColor
                    //               : AppColors.inactiveColor,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 1);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.bookmark,
                            color: i == 1
                                ? AppColors.tertiaryColor
                                : AppColors.inactiveColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Bookmark",
                            style: TextStyle(
                              fontSize: 13,
                              color: i == 1
                                  ? AppColors.tertiaryColor
                                  : AppColors.inactiveColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 2);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.chat,
                            color: i == 2
                                ? AppColors.tertiaryColor
                                : AppColors.inactiveColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(
                              fontSize: 13,
                              color: i == 2
                                  ? AppColors.tertiaryColor
                                  : AppColors.inactiveColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 3);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: i == 3
                                ? AppColors.tertiaryColor
                                : AppColors.inactiveColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 13,
                              color: i == 3
                                  ? AppColors.tertiaryColor
                                  : AppColors.inactiveColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
