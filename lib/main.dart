// import 'package:first_app/container/homepage.dart';
// import 'package:first_app/responsive/desktop_scree.dart';
// import 'package:first_app/responsive/mobile_screen.dart';
// import 'package:first_app/responsive/responsive_layout.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/signup_screen.dart';
import 'package:first_app/utills/colors.dart';
import 'package:flutter/material.dart';

// to run flutter in chrome just type in terminal : flutter run -d chrome

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Ui Design',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const LoginScreen(),
      home: const SignupScreen(),
      // home: const ResponsiveLayout(
      //     DesktopLayout: DesktopScreenLayout(),
      //     MobileLayout: MobileScreenLayout())
    );
  }
}
