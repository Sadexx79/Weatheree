import 'package:flutter_test/flutter_test.dart';
import 'package:weatheree/models/weather.dart';

void main() {
  test('Weather.fromJson parses correctly', () {
    final json = {
      'name': 'London',
      'main': {'temp': 20},
      'weather': [
        {'description': 'clear sky'}
      ]
    };
    final w = Weather.fromJson(json);
    expect(w.city, 'London');
    expect(w.temp, 20.0);
    expect(w.description, 'clear sky');
  });
}
