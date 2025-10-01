import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatheree/providers/weather_provider.dart';
import 'package:weatheree/services/weather_service.dart';
import 'package:weatheree/screens/home_screen.dart';
import 'package:weatheree/models/weather.dart';

void main() {
  testWidgets('HomeScreen shows weather card when provider has weather',
      (WidgetTester tester) async {
    final provider = WeatherProvider(WeatherService(apiKey: 'x'))
      ..weather = Weather(city: 'City', temp: 10.0, description: 'desc');

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pump();

    expect(find.text('City'), findsOneWidget);
    expect(find.text('desc'), findsOneWidget);
  });
}
