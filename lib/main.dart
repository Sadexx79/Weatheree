import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/weather_service.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherService = WeatherService(apiKey: AppConstants.apiKey);

    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(weatherService),
      child: MaterialApp(
        title: 'Weatheree',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(),
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  final _pages = [
    const HomeScreen(),
    const Center(child: Text('Forecast - coming soon')),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Forecast'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
