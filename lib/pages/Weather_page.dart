import 'package:flutter/material.dart';

class WeatherForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast', style: TextStyle(color:  Color.fromARGB(255, 8, 65, 0))),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: 2302 Mount Way, Montgomery, Alabama, 31712', ),
            Text('Date: 31/07/2024',),
            SizedBox(height: 16),
            Text('Day 1: 01/08/2024 32°C', ),
            Text('Day 2: 02/08/2024 29°C', ),
            Text('Day 3: 03/08/2024 30°C', ),
            // Add more days as needed
          ],
        ),
      ),
    );
  }
}
