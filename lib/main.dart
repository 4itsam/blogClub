import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:myfile/article.dart";
import "package:myfile/gen/fonts.gen.dart";
import "package:myfile/home.dart";
import "package:myfile/profile.dart";

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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottonNavigationBarHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = 0;

  late final map = {
    homeIndex: homekey,
    articleIndex: articlekey,
    searchIndex: searchkey,
    menuIndex: menukey,
  };

  GlobalKey<NavigatorState> homekey = GlobalKey();
  GlobalKey<NavigatorState> articlekey = GlobalKey();
  GlobalKey<NavigatorState> searchkey = GlobalKey();
  GlobalKey<NavigatorState> menukey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: homekey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                  Navigator(
                    key: articlekey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => ArticleScreen(),
                    ),
                  ),
                  Navigator(
                    key: searchkey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                  ),
                  Navigator(
                    key: menukey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottonNavigationBar(
                selectedIndex: selectedScreenIndex,
                onTap: (index) {
                  setState(() {
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Search Screen",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}

class BottonNavigationBar extends StatelessWidget {
  const BottonNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int index) onTap;
  final int selectedIndex;

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
                height: bottonNavigationBarHeight,
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
              right: 10,
              left: 10,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottonNavigationItem(
                    iconFileName: "Home.png",
                    activeIconeFileName: "HomeSelected.png",
                    title: "Home",
                    isSelected: selectedIndex == homeIndex,
                    onTap: () {
                      onTap(homeIndex);
                    },
                  ),
                  BottonNavigationItem(
                    iconFileName: "Articles.png",
                    activeIconeFileName: "ArticlesSelected.png",
                    title: "Articles",
                    isSelected: selectedIndex == articleIndex,
                    onTap: () {
                      onTap(articleIndex);
                    },
                  ),
                  Expanded(child: SizedBox(width: 20)),
                  BottonNavigationItem(
                    iconFileName: "Search.png",
                    activeIconeFileName: "SearchSelected.png",
                    title: "Search",
                    isSelected: selectedIndex == searchIndex,
                    onTap: () {
                      onTap(searchIndex);
                    },
                  ),
                  BottonNavigationItem(
                    iconFileName: "Menu.png",
                    activeIconeFileName: "MenuSelected.png",
                    title: "Menu",
                    isSelected: selectedIndex == menuIndex,
                    onTap: () {
                      onTap(menuIndex);
                    },
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
  final Function() onTap;

  const BottonNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconeFileName,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            spacing: 2,
            children: [
              Image.asset(
                isSelected
                    ? "assets/img/icons/$activeIconeFileName"
                    : "assets/img/icons/$iconFileName",
                height: isSelected ? 25 : 24,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: isSelected ? 12.5 : 12,
                  color: isSelected
                      ? bottonNavigationBarColor
                      : secondaryTextColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
