import 'package:dadjokesmobile/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.alluraTextTheme(Theme.of(context).textTheme),
        accentColor: Color(0xFFF15839),
      ),
      home: SplashScreen(),
    );
  }
}