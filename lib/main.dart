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
        // Black primary color
        primaryColor: Colors.black,

        // Black background color for scaffold (app's screen background)
        scaffoldBackgroundColor: Colors.black,

        // Text color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
        ),

        // AppBar color
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),

        // Material 3 style
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
