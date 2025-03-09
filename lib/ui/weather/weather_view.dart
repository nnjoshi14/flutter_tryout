import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tryout/ui/weather/weather_viewmodel.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (city) {
                ref.read(weatherViewModelProvider.notifier).fetchWeather(city);
              },
            ),
            const SizedBox(height: 20),
            weatherState.when(
              data: (weather) => weather != null
                  ? Column(
                children: [
                  Text("Location: ${weather.location}", style: const TextStyle(fontSize: 20)),
                  Text("Temperature: ${weather.temperature}°C", style: const TextStyle(fontSize: 20)),
                  Text("Condition: ${weather.description}", style: const TextStyle(fontSize: 20)),
                ],
              )
                  : const Text("Enter a city to get weather data."),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text("Error: $e"),
            ),
          ],
        ),
      ),
    );
  }
}
