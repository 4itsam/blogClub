import 'package:flutter/material.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/gen/fonts.gen.dart';
import 'package:myfile/main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTap = 0;
  static const int signupTap = 1;
  int selectedTabIndex = loginTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 32,

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Assets.img.icons.logo.svg(height: 70),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTap;
                              });
                            },
                            child: Text(
                              "Login".toUpperCase(),
                              style: themeData.textTheme.labelLarge,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signupTap;
                              });
                            },
                            child: Text(
                              "signup".toUpperCase(),
                              style: themeData.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: SingleChildScrollView(
                            child: selectedTabIndex == 0
                                ? Login(themeData: themeData)
                                : SignUp(themeData: themeData),
                          ),
                        ),
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

class Login extends StatelessWidget {
  const Login({super.key, required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: themeData.textTheme.bodyLarge!.apply(
            color: Colors.black,
            fontSizeDelta: 3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Sign in with your account",
          style: themeData.textTheme.bodySmall!.apply(
            fontWeightDelta: 0,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 34),
        TextField(
          style: TextStyle(color: secondaryTextColor, fontSize: 18),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 18,
              color: secondaryTextColor,
            ),
            label: Text("Username"),
          ),
        ),
        SizedBox(height: 30),
        PasswordTExtFeild(themeData: themeData, lable: "Password"),
        SizedBox(height: 36),
        ElevatedButton(
          style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),

            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(primaryColor),
          ),
          onPressed: () {},
          child: Text(
            "Login",
            style: themeData.textTheme.bodyLarge!.apply(
              letterSpacingFactor: 4,
              fontSizeDelta: -3,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot your Password?"),
            TextButton(onPressed: () {}, child: Text("Reset Here")),
          ],
        ),
        SizedBox(height: 16),
        Center(child: Text("OR Sign in with")),
        SizedBox(height: 16),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.google.image(width: 36, height: 36),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.facebook.image(width: 36, height: 36),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.twitter.image(width: 36, height: 36),
            ),
          ],
        ),
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to blog club",
          style: themeData.textTheme.bodyLarge!.apply(
            color: Colors.black,
            fontSizeDelta: 3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "please enter your information",
          style: themeData.textTheme.bodySmall!.apply(
            fontWeightDelta: 0,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 34),
        TextField(
          style: TextStyle(color: secondaryTextColor, fontSize: 18),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 18,
              color: secondaryTextColor,
            ),
            label: Text("Username"),
          ),
        ),
        SizedBox(height: 30),
        PasswordTExtFeild(themeData: themeData, lable: "Password"),
        SizedBox(height: 30),
        PasswordTExtFeild(themeData: themeData, lable: "re-Enter Password"),
        SizedBox(height: 36),
        ElevatedButton(
          style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),

            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(primaryColor),
          ),
          onPressed: () {},
          child: Text(
            "SignUp",
            style: themeData.textTheme.bodyLarge!.apply(
              letterSpacingFactor: 4,
              fontSizeDelta: -3,
            ),
          ),
        ),
        SizedBox(height: 20),

        SizedBox(height: 16),
        Center(child: Text("OR Sign up with")),
        SizedBox(height: 16),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.google.image(width: 36, height: 36),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.facebook.image(width: 36, height: 36),
            ),
            IconButton(
              onPressed: () {},
              icon: Assets.img.icons.twitter.image(width: 36, height: 36),
            ),
          ],
        ),
      ],
    );
  }
}

class PasswordTExtFeild extends StatefulWidget {
  const PasswordTExtFeild({
    super.key,
    required this.lable,
    required this.themeData,
  });

  @override
  State<PasswordTExtFeild> createState() => _PasswordTExtFeildState();
  final ThemeData themeData;
  final String lable;
}

class _PasswordTExtFeildState extends State<PasswordTExtFeild> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(color: secondaryTextColor, fontSize: 18),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontFamily: FontFamily.avenir,
          fontSize: 18,
          color: secondaryTextColor,
        ),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },

          child: Text(
            "show",
            style: widget.themeData.textTheme.bodyMedium!.apply(
              fontSizeDelta: 2,
              fontWeightDelta: 2,
              color: primaryColor,
            ),
          ),
        ),
        label: Text(widget.lable),
      ),
    );
  }
}
