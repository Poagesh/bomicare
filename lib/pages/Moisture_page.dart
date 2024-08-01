import 'package:flutter/material.dart';

class MoisturePage extends StatelessWidget {
  final Map<String, String> addressDetails;

  MoisturePage({required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Moisture', style: TextStyle(color: Color.fromARGB(255, 8, 65, 0))),
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
            Text('Current Soil Moisture: 60.3', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Last Updated: 31/07/2024 & 13:04:30', style: TextStyle(fontSize: 20)),
            SizedBox(height: 36),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View Historical Data'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Set Moisture Threshold'),
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
