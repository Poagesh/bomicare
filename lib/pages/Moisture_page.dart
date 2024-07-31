import 'package:flutter/material.dart';

class SoilMoisturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Moisture', style: TextStyle(color:  Color.fromARGB(255, 8, 65, 0))),
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: 2302 Mount Way, Montgomery, Alabama, 31712',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Crop Type: Maize',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Current Soil Moisture: 60.3',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Last Updated: 31/07/2024 & 13:04:30',style: TextStyle(fontSize: 20)),
            SizedBox(height: 36),
            Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                ElevatedButton(
                        onPressed: () {},
                        child: Text('View Historical Data'),
                ),
            SizedBox(height: 16), // Adds space between the buttons
                ElevatedButton(
                        onPressed: () {},
                        child: Text('Set Moisture Threshold'),
                ),
                    ],
              ),
              )

          ],
        ),
      ),
    );
  }
}
