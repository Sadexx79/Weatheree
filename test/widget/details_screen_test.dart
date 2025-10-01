import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:weatheree/screens/details_screen.dart';
import 'package:weatheree/models/weather.dart';

void main() {
  testWidgets('DetailsScreen displays weather details',
      (WidgetTester tester) async {
    final weather =
        Weather(city: 'Paris', temp: 25.5, description: 'sunny');

    await tester.pumpWidget(
      MaterialApp(
        home: DetailsScreen(weather: weather),
      ),
    );

    expect(find.text('Paris details'), findsOneWidget);
    expect(find.text('25.5°C'), findsOneWidget);
    expect(find.text('sunny'), findsOneWidget);
  });
}
