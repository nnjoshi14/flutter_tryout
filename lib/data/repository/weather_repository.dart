import 'package:flutter_tryout/data/model/weather.dart';
import 'package:flutter_tryout/data/service/weather_service.dart';

class WeatherRepository {
  final WeatherService _weatherService = WeatherService();

  Future<WeatherData> getWeather(String city) {
    return _weatherService.fetchWeather(city);
  }
}
