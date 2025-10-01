import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:weatheree/services/weather_service.dart';

void main() {
  test('fetchCurrentWeather returns parsed Weather', () async {
    final mockClient = MockClient((request) async => http.Response(
          jsonEncode({
            'name': 'TestCity',
            'main': {'temp': 12},
            'weather': [
              {'description': 'sunny'}
            ],
          }),
          200,
        ));

    final service = WeatherService(apiKey: 'x', client: mockClient);
    final w = await service.fetchCurrentWeather('TestCity');

    expect(w.city, 'TestCity');
    expect(w.temp, 12.0);
  });
}
