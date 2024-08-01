import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherPage extends StatefulWidget {
  final Map<String, String> addressDetails;

  WeatherPage({required this.addressDetails});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? latitude;
  double? longitude;
  List<String> nextThreeDays = [];
  List<String> temperatures = [];
  List<IconData> weatherIcons = [];
  List<String> weatherDescriptions = [];

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      fetchWeatherData();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> fetchWeatherData() async {
    if (latitude == null || longitude == null) return;

    final today = DateTime.now();
    final day1 = today.add(Duration(days: 1));
    final day2 = today.add(Duration(days: 2));
    final day3 = today.add(Duration(days: 3));
    final formattedDates = [
      today,
      day1,
      day2,
      day3
    ].map((date) => DateFormat('yyyy-MM-dd').format(date)).toList();

    final apiUrl =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=temperature_2m_max,weathercode&start=${formattedDates[0]}&end=${formattedDates[3]}&timezone=Asia/Kolkata';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        setState(() {
          nextThreeDays = formattedDates
              .sublist(1)
              .map((date) => DateFormat('dd/MM/yyyy').format(DateTime.parse(date)))
              .toList();

          temperatures = weatherData['daily']['temperature_2m_max']
              .sublist(1, 4)
              .map<String>((temp) => temp.toString() + "°C")
              .toList();

          weatherIcons = weatherData['daily']['weathercode']
              .sublist(1, 4)
              .map<IconData>((code) => getWeatherIcon(code))
              .toList();

          weatherDescriptions = weatherData['daily']['weathercode']
              .sublist(1, 4)
              .map<String>((code) => getWeatherDescription(code))
              .toList();
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  IconData getWeatherIcon(int weatherCode) {
    if (weatherCode == 0) {
      return WeatherIcons.day_sunny;
    } else if (weatherCode == 1 || weatherCode == 2) {
      return WeatherIcons.day_cloudy;
    } else if (weatherCode == 3) {
      return WeatherIcons.cloud;
    } else if (weatherCode >= 45 && weatherCode <= 48) {
      return WeatherIcons.fog;
    } else if (weatherCode >= 51 && weatherCode <= 57) {
      return WeatherIcons.rain_mix;
    } else if (weatherCode >= 61 && weatherCode <= 67) {
      return WeatherIcons.showers;
    } else if (weatherCode >= 71 && weatherCode <= 77) {
      return WeatherIcons.snow;
    } else if (weatherCode >= 80 && weatherCode <= 82) {
      return WeatherIcons.rain;
    } else if (weatherCode >= 85 && weatherCode <= 86) {
      return WeatherIcons.snow;
    } else if (weatherCode >= 95) {
      return WeatherIcons.thunderstorm;
    } else {
      return WeatherIcons.alien;
    }
  }

  String getWeatherDescription(int weatherCode) {
    if (weatherCode == 0) {
      return 'Sunny';
    } else if (weatherCode == 1 || weatherCode == 2) {
      return 'Partly Cloudy';
    } else if (weatherCode == 3) {
      return 'Cloudy';
    } else if (weatherCode >= 45 && weatherCode <= 48) {
      return 'Foggy';
    } else if (weatherCode >= 51 && weatherCode <= 57) {
      return 'Drizzle';
    } else if (weatherCode >= 61 && weatherCode <= 67) {
      return 'Showers';
    } else if (weatherCode >= 71 && weatherCode <= 77) {
      return 'Snow';
    } else if (weatherCode >= 80 && weatherCode <= 82) {
      return 'Rain';
    } else if (weatherCode >= 85 && weatherCode <= 86) {
      return 'Snow';
    } else if (weatherCode >= 95) {
      return 'Thunderstorm';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formattedToday = DateFormat('dd/MM/yyyy').format(today);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast',
            style: TextStyle(color: Color.fromARGB(255, 8, 65, 0))),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Location: ${widget.addressDetails['address1']}, ${widget.addressDetails['address2']}, ${widget.addressDetails['address3']}, ${widget.addressDetails['pincode']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('Date: $formattedToday', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            if (nextThreeDays.isNotEmpty && temperatures.isNotEmpty)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Day ${index + 1}: ${nextThreeDays[index]}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(width: 10),
                            BoxedIcon(weatherIcons[index], size: 40, color: Colors.orange),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${temperatures[index]} - ${weatherDescriptions[index]}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  }),
                ),
              )
            else
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
