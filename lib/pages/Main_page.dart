import 'package:flutter/material.dart';
import 'package:bomicare/Components/Navigation_bar.dart';
import 'package:bomicare/pages/Alert_page.dart';
import 'package:bomicare/pages/Home_page.dart';
import 'package:bomicare/pages/Moisture_page.dart';
import 'package:bomicare/pages/Recommendation_page.dart';
import 'package:bomicare/pages/Weather_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  Map<String, String> addressDetails = {
    'address1': '2302 Mount Way',
    'address2': 'Montgomery',
    'address3': 'Alabama, 31712',
  };

  final ValueNotifier<String> _recommendedCropNotifier = ValueNotifier<String>('');

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateAddress(Map<String, String> newAddressDetails) {
    setState(() {
      addressDetails = newAddressDetails;
    });
  }

  @override
  void dispose() {
    _recommendedCropNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(addressDetails: addressDetails, updateAddress: updateAddress),
      WeatherPage(addressDetails: addressDetails),
      MoisturePage(
        addressDetails: addressDetails,
        recommendedCropNotifier: _recommendedCropNotifier,
      ),
      RecommendationPage(addressDetails: addressDetails),
      AlertPage(addressDetails: addressDetails),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Navigation_Bar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
