import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  final Map<String, String> addressDetails;

  AlertPage({required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts', style: TextStyle(color: Color.fromARGB(255, 14, 41, 0))),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Current Location: ${addressDetails['address1']}, ${addressDetails['address2']}, ${addressDetails['address3']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            // Alert details go here
          ],
        ),
      ),
    );
  }
}
