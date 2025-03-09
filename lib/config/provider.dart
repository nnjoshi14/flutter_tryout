import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tryout/data/model/weather.dart';
import 'package:flutter_tryout/data/repository/weather_repository.dart';

final weatherRepositoryProvider = Provider((ref) => WeatherRepository());

final weatherProvider = FutureProvider.family<WeatherData, String>((ref, city) {
  final repository = ref.watch(weatherRepositoryProvider);
  return repository.getWeather(city);
});
