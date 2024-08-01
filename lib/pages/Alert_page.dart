import 'dart:math';
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
            Text(
              'Alerts:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: AlertList(),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertList extends StatefulWidget {
  @override
  _AlertListState createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  final List<String> _alerts = [
    'Heavy rain expected. Make sure to prevent Flooding',
    'High temperatures are forecasted for today. ',
    'Frost warning: Protect sensitive plants and cover outdoor pipes to prevent freezing.',
    'Strong winds are expected in the area. Secure loose items and avoid unnecessary travel.',
    'Thunderstorms are likely in the evening. Stay indoors and avoid using electrical appliances.',
    'Possible hail storm in the afternoon. Protect your crop, vehicles and stay indoors.',
    'Today is a sunny day! Good for crops!'
  ];

  late List<String> _randomAlerts;

  @override
  void initState() {
    super.initState();
    _generateRandomAlerts();
  }

  void _generateRandomAlerts() {
    final random = Random();
    final selectedCount = random.nextInt(3) + 3; // Generate a number between 3 and 5
    final shuffledAlerts = List<String>.from(_alerts)..shuffle(random);

    setState(() {
      _randomAlerts = shuffledAlerts.take(selectedCount).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _randomAlerts.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView(
            children: _randomAlerts.map((alert) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    alert,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }).toList(),
          );
  }
}
