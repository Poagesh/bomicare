// Weather_container.dart
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  final String location;
  final List<Map<String, dynamic>> weatherData;
  final double temperature;
  final double humidity;

  WeatherContainer({
    required this.location,
    required this.weatherData,
    required this.temperature,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Location: $location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('Current Weather:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weatherData.map((data) {
              return Column(
                children: [
                  Image.network('https://openweathermap.org/img/wn/${data['icon']}@2x.png', height: 50),
                  Text('${data['hour']}h'),
                  Text('${data['description']}'),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text('Temperature: ${temperature.toStringAsFixed(1)}°C', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Humidity: ${humidity.toStringAsFixed(1)}%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
