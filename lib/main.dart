import 'package:flutter/material.dart';
import 'package:flutter_covid19_trackingapp/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Primary color as #E0F7FA (aqua blue)
        primaryColor: const Color(0xFFE0F7FA),

        // Background color for scaffold
        scaffoldBackgroundColor: const Color(0xFFE0F7FA), // Light aqua blue background

        // Text color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Black text for better contrast
          bodyMedium: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
        ),

        // AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0F7FA), // Light aqua blue AppBar
          titleTextStyle: TextStyle(
            color: Colors.black, // AppBar title color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black), // AppBar icons color
        ),

        // Material 3 style
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
