import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Weatheree')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final city = _controller.text.trim();
                if (city.isNotEmpty) prov.fetch(city);
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),
            if (prov.loading) const CircularProgressIndicator(),
            if (prov.error != null) Text('Error: ${prov.error}'),
            if (prov.weather != null)
              WeatherCard(
                weather: prov.weather!,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(weather: prov.weather!),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
