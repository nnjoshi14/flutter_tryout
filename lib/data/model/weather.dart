class WeatherData {
  final String location;
  final double temperature;
  final String description;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.description,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location']['name'],
      temperature: json['current']['temperature'].toDouble(),
      description: json['current']['weather_descriptions'][0],
    );
  }
}
