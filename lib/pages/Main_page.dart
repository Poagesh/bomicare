import 'package:bomicare/pages/Alert_page.dart';
import 'package:bomicare/pages/Home_page.dart';
import 'package:bomicare/pages/Moisture_page.dart';
import 'package:bomicare/pages/Recommendation_page.dart';
import 'package:bomicare/pages/Weather_page.dart';
import 'package:flutter/material.dart';
import 'package:bomicare/Components/Navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    WeatherForecastPage(),
    SoilMoisturePage(),
    IrrigationRecommendationsPage(),
    AlertsNotificationsPage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Navigation_Bar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
