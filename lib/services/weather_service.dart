import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../utils/constants.dart';

class WeatherService {
  final String apiKey;
  final http.Client client;

  WeatherService({required this.apiKey, http.Client? client})
      : client = client ?? http.Client();

  Future<Weather> fetchCurrentWeather(String city) async {
    final url = Uri.parse(
      '${AppConstants.baseUrl}/weather?q=$city&appid=$apiKey&units=metric',
    );

    final res = await client.get(url);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather: ${res.statusCode}');
    }
  }
}
