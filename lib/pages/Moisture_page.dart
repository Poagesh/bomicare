import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoisturePage extends StatefulWidget {
  final Map<String, String> addressDetails;
  final ValueNotifier<String> recommendedCropNotifier; // Use ValueNotifier

  MoisturePage({required this.addressDetails, required this.recommendedCropNotifier});

  @override
  _MoisturePageState createState() => _MoisturePageState();
}

class _MoisturePageState extends State<MoisturePage> {
  late ValueNotifier<String> recommendedCropNotifier;
  late ValueNotifier<String> lastUpdatedNotifier;

  @override
  void initState() {
    super.initState();
    recommendedCropNotifier = widget.recommendedCropNotifier;
    lastUpdatedNotifier = ValueNotifier<String>(DateFormat('dd/MM/yyyy & HH:mm:ss').format(DateTime.now()));

    // Update the last updated time periodically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateLastUpdatedTime();
    });
  }

  void updateLastUpdatedTime() {
    final now = DateTime.now();
    lastUpdatedNotifier.value = DateFormat('dd/MM/yyyy & HH:mm:ss').format(now);
  }

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
              'Current Location: ${widget.addressDetails['address1']}, ${widget.addressDetails['address2']}, ${widget.addressDetails['address3']}, ${widget.addressDetails['pincode']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ValueListenableBuilder<String>(
              valueListenable: recommendedCropNotifier,
              builder: (context, recommendedCrop, child) {
                return Text('Crop Type: $recommendedCrop', style: TextStyle(fontSize: 20));
              },
            ),
            SizedBox(height: 16),
            Text('Current Soil Moisture: 60.3', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            ValueListenableBuilder<String>(
              valueListenable: lastUpdatedNotifier,
              builder: (context, lastUpdated, child) {
                return Text('Last Updated: $lastUpdated', style: TextStyle(fontSize: 20));
              },
            ),
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

  @override
  void dispose() {
    recommendedCropNotifier.dispose();
    lastUpdatedNotifier.dispose();
    super.dispose();
  }
}
