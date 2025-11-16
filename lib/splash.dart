import 'package:flutter/cupertino.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
    return Stack(
      children: [
        Container(color: Color(0xffFFFFFF)),
        Positioned.fill(
          child: Assets.img.background.splash.image(fit: BoxFit.fill),
        ),
        Center(child: Assets.img.icons.logo.svg()),
      ],
    );
  }
}
