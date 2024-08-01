import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  final Map<String, String> addressDetails;

  RecommendationPage({required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Irrigation Recommendations', style: TextStyle(color: Color.fromARGB(255, 8, 65, 0))),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Location: ${addressDetails['address1']}, ${addressDetails['address2']}, ${addressDetails['address3']}, ${addressDetails['pincode']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('Crop Type: Maize', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Optimal Watering Time: 6:00 am | 7:00 am | 5:00 pm | 6:00 pm', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Recommended Interval: 6 hrs', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Next Watering: 31/07/2024 & 7:00:00', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle adjust settings action
                    },
                    child: Text('Adjust Settings'),
                    style: ElevatedButton.styleFrom(
                      
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle view soil moisture action
                    },
                    child: Text('View Soil Moisture'),
                    style: ElevatedButton.styleFrom(
                    
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
