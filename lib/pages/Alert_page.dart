import 'package:flutter/material.dart';

class AlertsNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts & Notifications', style: TextStyle(color:  Color.fromARGB(255, 8, 65, 0))),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Alerts:',),
            Text('- Alert 1: Its 6:00 AM time to water the crops!',),
            Text('- Alert 2: Today is a Sunny day! The Temperature is 32°C.',),
            Text('- Alert 3: The crops are ready to add the Fertilizers!',),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Set Notification Preferences')),
          ],
        ),
      ),
    );
  }
}
