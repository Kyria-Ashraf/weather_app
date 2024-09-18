class WeatherModel {
  final String? cityName;
  final String? date;
  final String? lastUpdated;
  final double? minTemp;
  final double? maxTemp;
  final double? temp;
  final String? condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.lastUpdated,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['address'] ?? "",
      date: json['days'][0]['datetime'] ?? "1/1/1900",
      lastUpdated: json['currentConditions']['datetime'] ?? "00:00",
      maxTemp: json['days'][0]['tempmax'] ?? -100,
      minTemp: json['days'][0]['tempmin'] ?? -100,
      temp: json['days'][0]['temp'] ?? -100,
      condition: json['currentConditions']['conditions'] ?? "",
    );
  }
}
