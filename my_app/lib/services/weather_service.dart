import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherServices {
  static const String apiKey = 'b0a4b1a84c96ae2a3d9e335d5e7c9b8b';
  static const String baseUrl ='https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> getWeather(String cityName) async {
    try {
      final String url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';

      final http.Response response = await http.get(Uri.parse(url),
        headers: {'Content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data)
      }
      else if (response.statusCode == 404) {
        throw Exception('City not found');
      }
      catch {
        throw Exception('Failed to load weather data');
    }
  }
}