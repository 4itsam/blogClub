import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:myfile/gen/fonts.gen.dart";
import "package:myfile/splash.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

final primaryTextColor = Color(0xff0D253C);
final secondaryTextColor = Color(0xff2D4379);
final primaryColor = Color(0xff376AED);
final scaffoldBG = Color(0xffF7F9FF);
final bottonNavigationBarColor = Color(0xff0047CC);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: secondaryTextColor,
          ),
          headlineLarge: TextStyle(
            fontSize: 24,
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 14,
            color: secondaryTextColor,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: FontFamily.avenir,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),

          bodySmall: TextStyle(
            color: primaryColor,
            fontFamily: FontFamily.avenir,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          displayLarge: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.avenir,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
          displayMedium: TextStyle(
            color: Color(0xff0D253C),
            fontFamily: FontFamily.avenir,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: secondaryTextColor,
          ),
          labelLarge: TextStyle(
            color: themeData.colorScheme.onPrimary,
            fontFamily: FontFamily.avenir,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),

        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: scaffoldBG,
          onSurface: primaryTextColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: scaffoldBG,
          titleSpacing: 32,
          actionsPadding: EdgeInsets.fromLTRB(0, 0, 32, 0),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryTextColor,
          actionTextColor: Colors.white,
          contentTextStyle: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w500,
          ),
          behavior: SnackBarBehavior.fixed,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Stack(children: [Positioned.fill(child: SplashScreen())]),
    );
  }
}

class BottonNavigationBar extends StatelessWidget {
  const BottonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 85,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(60, 155, 132, 135),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(0, -8),
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 2,
              left: 0,
              right: 0,

              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    strokeAlign: 0,
                    width: 8,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Image.asset("assets/img/icons/plus.png"),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottonNavigationItem(
                    iconFileName: "HomeSelected.png",
                    activeIconeFileName: "Home.png",
                    title: "Home",
                    isSelected: true,
                  ),
                  BottonNavigationItem(
                    iconFileName: "Articles.png",
                    activeIconeFileName: "",
                    title: "Articles",
                    isSelected: false,
                  ),
                  SizedBox(width: 30),
                  BottonNavigationItem(
                    iconFileName: "Search.png",
                    activeIconeFileName: "",
                    title: "Search",
                    isSelected: false,
                  ),
                  BottonNavigationItem(
                    iconFileName: "Menu.png",
                    activeIconeFileName: "",
                    title: "Menu",
                    isSelected: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottonNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconeFileName;
  final String title;
  final bool isSelected;

  const BottonNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconeFileName,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      children: [
        Image.asset("assets/img/icons/$iconFileName", height: 24),
        Text(
          title,
          style: isSelected
              ? TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 12,
                  color: bottonNavigationBarColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                )
              : TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 12,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
        ),
      ],
    );
  }
}
