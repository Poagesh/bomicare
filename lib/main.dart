import 'package:flutter/material.dart';
import 'package:bomicare/UserInfos/Login_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF90EE90), // Light green color for buttons
            foregroundColor: Color.fromARGB(255, 4, 59, 0), // Dark olive green color for button text
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 4, 59, 0)), // Dark olive green color for large body text
          bodyMedium: TextStyle(color: Color.fromARGB(255, 4, 59, 0)), // Dark olive green color for medium body text
          headlineLarge: TextStyle(color: Color.fromARGB(255, 4, 59, 0)), // Dark olive green color for large headlines
          headlineMedium: TextStyle(color: Color.fromARGB(255, 4, 59, 0)), // Dark olive green color for medium headlines
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xFF006400)), // Very dark green color for labels
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIconColor: Color(0xFF006400), // Very dark green color for prefix icons
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF006400)), // Very dark green color for focused border
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
