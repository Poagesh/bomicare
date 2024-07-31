import 'package:bomicare/Inputs/InputPageOne.dart';
import 'package:bomicare/UserInfos/UserProfile_Page.dart';
import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color.fromARGB(255, 14, 41, 0))),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Color.fromARGB(255, 6, 34, 0),
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
            Text('Current Location: 2302 Mount Way, Montgomery, Alabama, 31712', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Weather: ', style: TextStyle(fontSize: 20)),
                SizedBox(height: 40),
                Icon(Icons.wb_sunny, color: Color(0xFF556B2F), size: 40,),
              ],
            ),
            SizedBox(height: 30),
            Text('Temp: 32°C  |  Humidity: 60.3', style: TextStyle(fontSize: 20)),
            SizedBox(height: 200),
            
            Center(
                  child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCropPage()), // Navigate to AddCropPage
                    );
                  },
              child: Text('Add Crop'),
              ),
              )
          ],
        ),
      ),
      // No NavigationBar here, it's handled in MainPage
    );
  }
}
