class Weather {
  final double temperature;
  final double weathercode;

  Weather({
    required this.temperature,
    required this.weathercode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: (json['temperature'] as num).toDouble(), // 確保轉換為 double
      weathercode: (json['weathercode'] as num).toDouble(), // 確保轉換為 double
    );
  }
}