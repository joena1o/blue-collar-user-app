import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/bookmark.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/chat_page.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/explore_page.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/tabs/profile_tab.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/category_carousel.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/item_card.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/label_app_bar.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/special_carousel.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

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
              if (i == 0) const AppBarWidget(),
              if (i == 2) const LabelAppBar(title: "Bookmark"),
              if (i == 3)
                const LabelAppBar(
                  title: "Chat"
                ),
              if (i == 4) const LabelAppBar(title: "Profile"),

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
                      ? const MapSample()
                      : i == 2
                          ? const BookmarkPage()
                          : i == 3
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
                padding: const EdgeInsets.only(
                    top: 15, left: 22, right: 22, bottom: 15),
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
                            UniconsLine.home,
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
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 1);
                      },
                      child: Column(
                        children: [
                          Icon(
                            UniconsLine.globe,
                            color: i == 1
                                ? AppColors.tertiaryColor
                                : AppColors.inactiveColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Explore",
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
                            UniconsLine.bookmark,
                            color: i == 2
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
                            UniconsLine.chat,
                            color: i == 3
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
                              color: i == 3
                                  ? AppColors.tertiaryColor
                                  : AppColors.inactiveColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => i = 4);
                      },
                      child: Column(
                        children: [
                          Icon(
                            UniconsLine.user,
                            color: i == 4
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
                              color: i == 4
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
