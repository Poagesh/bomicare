import 'package:bomicare/Inputs/InputPageOne.dart';
import 'package:bomicare/UserInfos/UserProfile_Page.dart';
import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color(0xFF556B2F))),
        backgroundColor: Color(0xFF90EE90),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Color(0xFF556B2F),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text('Current Location: 2302 Mount Way, Montgomery, Alabama, 31712', style: TextStyle(color: Color(0xFF556B2F))),
            Row(
              children: [
                Text('Weather: ', style: TextStyle(color: Color(0xFF556B2F))),
                Icon(Icons.wb_sunny, color: Color(0xFF556B2F)),
              ],
            ),
            Text('Temp: 32°C  |  Humidity: 60.3', style: TextStyle(color: Color(0xFF556B2F))),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('View Forecast')),
            ElevatedButton(onPressed: () {}, child: Text('Soil Moisture')),
            ElevatedButton(onPressed: () {}, child: Text('Irrigation Recommendations')),
            ElevatedButton(onPressed: () {}, child: Text('Alerts & Notifications')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCropPage()), // Navigate to AddCropPage
                );
              },
              child: Text('Add Crop'),
            ),
          ],
        ),
      ),
      // No NavigationBar here, it's handled in MainPage
    );
  }
}
