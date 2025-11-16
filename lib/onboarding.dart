import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
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
                height: 324,
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
                    Row(
                      children: [
                        SmoothPageIndicator(
                          effect: WormEffect(
                            activeDotColor: const Color.fromARGB(
                              255,
                              13,
                              109,
                              189,
                            ),
                            dotColor: const Color.fromARGB(255, 180, 180, 180),
                            paintStyle: PaintingStyle.fill,
                          ),
                          controller: pageController,
                          count: 4,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                              ),
                            ),
                            minimumSize: WidgetStatePropertyAll(Size(100, 60)),
                            backgroundColor: WidgetStatePropertyAll(
                              themedata.colorScheme.primary,
                            ),
                          ),
                          onPressed: () {},
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: themedata.colorScheme.onPrimary,
                            size: 26,
                          ),
                        ),
                      ],
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
