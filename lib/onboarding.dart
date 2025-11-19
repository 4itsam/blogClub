import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfile/data.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/main.dart';
import 'package:myfile/profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  final onboardingData = OnBordingDatabase.onBordingItem;
  int page = 0;
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page!.round() != page) {
        setState(() {
          page = pageController.page!.round();
          debugPrint("selected page => $page");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themedata = Theme.of(context);
    return Scaffold(
      backgroundColor: themedata.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Assets.img.background.onboarding.image()),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: themedata.colorScheme.onPrimary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(52, 44, 44, 44),
                      blurRadius: 26,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: OnBordingDatabase.onBordingItem.length,

                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16,
                              children: [
                                SizedBox(
                                  width: 230,
                                  child: Text(
                                    onboardingData[index].title,
                                    style: themedata.textTheme.displayMedium,
                                  ),
                                ),
                                Text(
                                  onboardingData[index].description,
                                  style: themedata.textTheme.displaySmall,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        right: 20,
                        left: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            effect: ExpandingDotsEffect(
                              activeDotColor: primaryColor,
                              dotColor: Colors.grey.shade400,
                              expansionFactor: 2.3,
                            ),
                            controller: pageController,
                            count: 4,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                              ),
                              minimumSize: WidgetStatePropertyAll(
                                Size(100, 60),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                themedata.colorScheme.primary,
                              ),
                            ),
                            onPressed: () {
                              if (page == onboardingData.length - 1) {
                                Navigator.of(context).pushReplacement(
                                  CupertinoDialogRoute(
                                    builder: (context) => ProfileScreen(),
                                    context: context,
                                  ),
                                );
                              } else {
                                pageController.animateToPage(
                                  page + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            child: Icon(
                              page == onboardingData.length - 1
                                  ? CupertinoIcons.check_mark
                                  : CupertinoIcons.arrow_right,
                              color: themedata.colorScheme.onPrimary,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
