import 'dart:convert';
import 'package:flutter_tryout/data/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '10077b04f17259ef8f86a02f47d81ab6';
  final String baseUrl = 'http://api.weatherstack.com/current';

  Future<WeatherData> fetchWeather(String city) async {
    final Uri url = Uri.parse('$baseUrl?access_key=$apiKey&query=$city');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return WeatherData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
