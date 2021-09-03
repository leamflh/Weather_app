import 'package:flutter/material.dart';
import 'package:weather_app/Screens/LaunchingScreen.dart';
import 'package:weather_app/Screens/Welcome_Screen.dart';
import 'package:weather_app/Screens/SearchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Launching Screen',
      routes: {
        'Launching Screen':(context)=>LaunchingScreen(),
        'Welcome Screen':(context)=>WelcomeScreen(),
        'Search Screen':(context)=>SearchScreen(),
      },
    );
  }
}

