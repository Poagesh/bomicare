# BoomiCare

BoomiCare is a Flutter application designed to help farmers with crop recommendations based on soil properties, weather data, and location. The app allows users to add crop details, upload soil images, and get recommendations on suitable crops to grow. It also provides weather updates for the locations where crops are planted.

## Features

- **Add Crop**: Input soil properties and upload soil images to get crop recommendations.
- **Weather Updates**: Get current weather information for the locations where crops are planted.
- **User Profile**: Manage user profile information.
- **Geolocation**: Automatically fetch the current location for precise recommendations.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) 2.0 or above
- Android Studio or Xcode for iOS development
- A physical device or emulator for testing

### Installation

1. **Clone the repository**

    ```bash
    git clone https://github.com/yourusername/bomicare.git
    cd bomicare
    ```

2. **Install dependencies**

    ```bash
    flutter pub get
    ```

3. **Setup for Android**

    - Open `android/app/src/main/AndroidManifest.xml` and add the following permissions:

      ```xml
      <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
      <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
      ```

    - Ensure your `MainActivity.java` or `MainActivity.kt` is correctly configured:

      ```java
      import io.flutter.embedding.android.FlutterActivity;

      public class MainActivity extends FlutterActivity {
      }
      ```

    - If you're using `FlutterFragmentActivity`:

      ```java
      import io.flutter.embedding.android.FlutterFragmentActivity;

      public class MainActivity extends FlutterFragmentActivity {
      }
      ```

    - For Kotlin:

      ```kotlin
      import io.flutter.embedding.android.FlutterFragmentActivity

      class MainActivity: FlutterFragmentActivity() {
      }
      ```

4. **Setup for iOS**

    - Open `ios/Runner/Info.plist` and add the following keys:

      ```xml
      <key>NSLocationWhenInUseUsageDescription</key>
      <string>We need your location to provide better service.</string>
      <key>NSLocationAlwaysUsageDescription</key>
      <string>We need your location to provide better service.</string>
      ```

5. **Run the app**

    Connect your device or start an emulator, then run:

    ```bash
    flutter run
    ```
6. **Run the Local Server**

    Download the python latest version
   
   ```bash
    pip install pandas numpy matplotlib seaborn scikit-learn
    ```
   Run the Flask_api.py
   
   ```bash
    python Flask_api.py
    ```
   

## Project Structure

```plaintext
.
├── android
├── assets
│   └── images
├── ios
├── lib
│   ├── Components
│   │   └── WeatherContainer.dart
│   ├── Inputs
│   │   └── AddCropPage.dart
│   ├── UserInfos
│   │   └── UserProfile_Page.dart
│   ├── main.dart
├── pubspec.yaml
└── README.md
```
- **main.dart**: Entry point of the application.
- **add_crop_page.dart**: UI and logic for adding soil data and getting crop recommendations.
- **moisture_page.dart**: UI for displaying soil moisture and last updated time.
- **weather_page.dart**: UI for displaying weather forecast.

## Detailed Guide

### Adding Crop Data

1. **Navigate to the "Add Crop" page.**
2. **Input the soil data and address details:**
    - **Nitrogen amount** (N)
    - **Phosphorus amount** (P)
    - **Potassium amount** (K)
    - **Temperature**
    - **Humidity**
    - **Rainfall**
    - **pH value**
    - **Address line 1**
    - **Address line 2**
    - **Address line 3**
    - **Pincode**
    - **Area**

3. **Upload a soil image** (optional):
    - Click on "Upload Soil Image" to select an image from your gallery.

4. **Save Address**:
    - Click on "Save Address" to save the address details.

5. **Get Crop Recommendation**:
    - Click on "Get Crop Recommendation" to get a recommended crop based on the input data.

### Viewing Weather Forecast

1. **Navigate to the "Weather Forecast" page.**
2. **Automatic Weather Data Fetch**:
    - The app will automatically fetch the weather data based on the current location.
3. **View Weather Forecast**:
    - The weather forecast for the next three days with temperature and weather icons will be displayed.

### Monitoring Soil Moisture

1. **Navigate to the "Soil Moisture" page.**
2. **View Soil Moisture Data**:
    - The app will display the current soil moisture and the last updated time.
3. **Additional Options**:
    - **View Historical Data**: Click to view past soil moisture data.
    - **Set Moisture Threshold**: Click to set a threshold for soil moisture.

## API Integration

### Crop Recommendation API

The app makes a POST request to the `/predict` endpoint to get crop recommendations. Ensure that the API server is running and accessible.

```plaintext
POST http://10.0.2.2:5000/predict
Content-Type: application/json

{
  "N": <nitrogen_value>,
  "P": <phosphorus_value>,
  "K": <potassium_value>,
  "temperature": <temperature_value>,
  "humidity": <humidity_value>,
  "ph": <ph_value>,
  "rainfall": <rainfall_value>
}
```
**Weather Data API**
The app fetches weather data from the Open Meteo API based on the current location. Ensure that your device has internet access to fetch the data.

Example API Call:
```plaintext
GET https://api.open-meteo.com/v1/forecast?latitude=<latitude>&longitude=<longitude>&daily=temperature_2m_max&start=<start_date>&end=<end_date>&timezone=Asia/Kolkata
```

**Troubleshooting**
Location Services: Ensure that location services are enabled on your device.
Network Calls: Make sure that your API server is running and accessible.
Dependencies: Run flutter pub get to install all required dependencies.


**Acknowledgments**
Open Meteo for providing weather data.
Geolocator package for location services.
Flutter team for the awesome framework.

**Contact**
If you have any questions or feedback, please reach out to poagesh59@gmail.com.


