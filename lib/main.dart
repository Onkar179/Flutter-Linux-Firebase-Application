import 'package:firebase_app/terminal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/login.dart';
import 'package:firebase_app/reg.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_app/home.dart';
import 'package:page_transition/page_transition.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedSplashScreen(
            backgroundColor: Colors.black,
            duration: 20,
            splash: Image.asset('assets/os.jpg'),
            splashIconSize: double.infinity,
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.upToDown,
            nextScreen: Home()),
      ),
      routes: {
        "login": (context) => MyLogin(),
        "register": (context) => MyReg(),
        "terminal": (context) => MyApp()
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
