import 'package:flutter/material.dart';
import '../models/weather.dart';

class DetailsScreen extends StatelessWidget {
  final Weather weather;

  const DetailsScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${weather.city} details')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${weather.temp.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(weather.description),
          ],
        ),
      ),
    );
  }
}
