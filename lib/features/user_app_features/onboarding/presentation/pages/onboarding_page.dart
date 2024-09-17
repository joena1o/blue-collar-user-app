import 'package:blue_collar_app/core/app_colors.dart';
import 'package:blue_collar_app/features/user_app_features/onboarding/presentation/widgets/page_one.dart';
import 'package:blue_collar_app/features/user_app_features/onboarding/presentation/widgets/page_three.dart';
import 'package:blue_collar_app/features/user_app_features/onboarding/presentation/widgets/page_two.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose(); // Always dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            GradientText(
              'BlueCollar',
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600),
              colors: [AppColors.primaryColor, AppColors.tertiaryColor],
            ),
            SizedBox(
              height: Responsive.getSize(context).height * .6,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [PageOne(), PageTwo(), PageThree()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PageViewDotIndicator(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                currentItem: currentPage,
                count: 3,
                unselectedColor: const Color(0xffD9D9D9),
                selectedColor: AppColors.secondaryColor,
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
                onItemClicked: (index) {},
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.secondaryColor, AppColors.primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: Responsive.getSize(context).width * .9,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: AppColors.lightColor,
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    onPressed: () {
                      if (currentPage < 2) {
                        pageController.animateToPage(
                          currentPage + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        return;
                      }
                      context.go("/login");
                    },
                    child: const Text("Get Started"))),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  List<Widget> pages = [const PageOne(), const PageTwo(), const PageThree()];
}
