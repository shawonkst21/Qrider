import 'package:bike/HOME/QR/scanner.dart';
import 'package:bike/HOME/community/communityPage.dart';
import 'package:bike/HOME/home.dart';
import 'package:bike/introduction/onboardingScreen.dart';
import 'package:bike/login/Register.dart';
import 'package:bike/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(
        255,
        255,
        255,
        255,
      ), //! Set the color you want
      statusBarIconBrightness: Brightness.dark, //! White icons
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const Register(),
        '/home': (context) => const homepage(),
        '/scanner': (context) => const qr_scanner(),
        '/community': (context) => CommunityPage(),
      },
    );
  }
}
