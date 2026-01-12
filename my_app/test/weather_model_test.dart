import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
// Adjust this import path if your app name is different from 'my_app'
import 'package:my_app/models/weather.dart';

void main() {
  group('Weather Model Test', () {
    test('should return a valid Weather object from realistic Manila JSON', () {
      // 1. Arrange: Realistic Manila sample from OpenWeatherMap API
      final Map<String, dynamic> manilaJson = {
        "coord": {"lon": 120.9822, "lat": 14.6042},
        "weather": [
          {
            "id": 801,
            "main": "Clouds",
            "description": "few clouds",
            "icon": "02d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 31.5,
          "feels_like": 34.2,
          "temp_min": 30.0,
          "temp_max": 33.0,
          "pressure": 1010,
          "humidity": 65
        },
        "visibility": 10000,
        "wind": {"speed": 3.6, "deg": 10},
        "clouds": {"all": 20},
        "dt": 1705051200,
        "sys": {
          "type": 1,
          "id": 7905,
          "country": "PH",
          "sunrise": 1705011880,
          "sunset": 1705052445
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      };

      // 2. Act
      final weather = Weather.fromJson(manilaJson);

      // 3. Assert: Check if the fields map correctly
      // Note: Update these field names to match your actual Weather model properties
      expect(weather.cityName, 'Manila');
      expect(weather.temperature, 31.5);
      expect(weather.mainCondition, 'Clouds');
    });

    test('should handle temperature as an integer or double safely', () {
      // Some APIs return 30 instead of 30.0; ensure your fromJson handles .toDouble()
      final Map<String, dynamic> intTempJson = {
        "weather": [{"main": "Clear"}],
        "main": {"temp": 30},
        "name": "Manila"
      };

      final weather = Weather.fromJson(intTempJson);
      expect(weather.temperature, 30.0);
    });
  });
}
