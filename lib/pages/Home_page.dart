import 'package:bomicare/Inputs/InputPageOne.dart';
import 'package:flutter/material.dart';
import 'package:bomicare/UserInfos/UserProfile_Page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  final Map<String, String> addressDetails;
  final Function(Map<String, String>) updateAddress;

  HomePage({
    this.addressDetails = const {
      'address1': 'Unknown',
      'address2': 'Unknown',
      'address3': 'Unknown',
      'pincode': 'Unknown',
    },
    required this.updateAddress,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? latitude;
  double? longitude;
  IconData? weatherIcon;
  String temperature = 'N/A';
  String humidity = 'N/A';
  String weatherDescription = 'N/A';

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
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    fetchWeatherData();
    fetchClimateData();
  }

  Future<void> fetchWeatherData() async {
    if (latitude == null || longitude == null) return;

    final weatherApiUrl =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true&timezone=Asia/Kolkata';

    try {
      final response = await http.get(Uri.parse(weatherApiUrl));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        print('Weather data: $weatherData'); // Debug print
        final weatherCode = weatherData['current_weather']['weathercode'];
        setState(() {
          temperature = '${weatherData['current_weather']['temperature']}°C';
          weatherIcon = getWeatherIcon(weatherCode);
          weatherDescription = getWeatherDescription(weatherCode);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  Future<void> fetchClimateData() async {
    if (latitude == null || longitude == null) return;

    final climateApiUrl =
        'https://api.open-meteo.com/v1/climate?latitude=$latitude&longitude=$longitude&daily=humidity_2m_mean&start=2024-07-01&end=2024-07-31&timezone=Asia/Kolkata';

    try {
      final response = await http.get(Uri.parse(climateApiUrl));
      if (response.statusCode == 200) {
        final climateData = json.decode(response.body);
        setState(() {
          humidity = '${climateData['daily']['humidity_2m_mean'][0]}%';
        });
      } else {
        throw Exception('Failed to load climate data');
      }
    } catch (e) {
      print('Error fetching climate data: $e');
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color.fromARGB(255, 14, 41, 0))),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Color.fromARGB(255, 6, 34, 0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Current Location: ${widget.addressDetails['address1']}, ${widget.addressDetails['address2']}, ${widget.addressDetails['address3']}, ${widget.addressDetails['pincode']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Weather: ', style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                weatherIcon != null
                    ? BoxedIcon(weatherIcon!, size: 40, color: Colors.orange)
                    : CircularProgressIndicator(),
                SizedBox(width: 10),
                Text(weatherDescription, style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Text('Temp: $temperature', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Humidity: $humidity', style: TextStyle(fontSize: 20)),
            SizedBox(height: 200),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCropPage(updateAddress: widget.updateAddress),
                    ),
                  );
                },
                child: Text('Add Crop'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
