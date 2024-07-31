import 'package:flutter/material.dart';

class IrrigationRecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Irrigation Recommendations', style: TextStyle(color:  Color.fromARGB(255, 8, 65, 0))),
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
            Text('Optimal Watering Time: 6:00 am | 7:00 am | 5:00 pm | 6:00 pm',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Recommended Interval: 6 hrs',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Next Watering: 31/07/2024 & 7:00:00',style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                ElevatedButton(
                        onPressed: () {},
                        child: Text('Adjust Settings'),
                ),
            SizedBox(height: 16), // Adds space between the buttons
                ElevatedButton(
                        onPressed: () {},
                        child: Text('View Soil Moisture'),
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
