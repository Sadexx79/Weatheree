class Weather {
  final String city;
  final double temp;
  final String description;

  Weather({
    required this.city,
    required this.temp,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String? ?? '';
    final temp = ((json['main']?['temp']) as num?)?.toDouble() ?? 0.0;
    final description = (json['weather'] as List).isNotEmpty
        ? json['weather'][0]['description'] as String
        : '';

    return Weather(city: name, temp: temp, description: description);
  }
}
