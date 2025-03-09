import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tryout/config/provider.dart';
import 'package:flutter_tryout/data/model/weather.dart';
import 'package:flutter_tryout/data/repository/weather_repository.dart';

class WeatherViewModel extends StateNotifier<AsyncValue<WeatherData?>> {
  final WeatherRepository _repository;

  WeatherViewModel(this._repository) : super(const AsyncValue.loading());

  Future<void> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getWeather(city);
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final weatherViewModelProvider =
StateNotifierProvider<WeatherViewModel, AsyncValue<WeatherData?>>((ref) {
  final repository = ref.watch(weatherRepositoryProvider);
  return WeatherViewModel(repository);
});
