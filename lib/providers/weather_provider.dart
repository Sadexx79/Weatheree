import 'package:flutter/foundation.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService service;

  Weather? weather;
  bool loading = false;
  String? error;

  WeatherProvider(this.service);

  Future<void> fetch(String city) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final w = await service.fetchCurrentWeather(city);
      weather = w;
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
