# Weatheree 🌤️

Weatheree is a Flutter-based weather application that fetches live weather data from the OpenWeatherMap API.  
The app demonstrates **multi-screen navigation**, **state management with Provider**, **API integration**, and **automated testing**.

---

## Features
- **Multiple Screens**: Home, Forecast (placeholder), and Settings.
- **Navigation**: Implemented with `BottomNavigationBar`.
- **State Management**: Using the `provider` package.
- **API Integration**: Fetches live weather data from OpenWeatherMap.
- **User-Friendly UI**: Simple, clean, and responsive design.
- **Automated Tests**: Includes unit and widget tests.

---

## Requirements
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.0.0)
- Dart >=3.0.0
- Android Studio / Xcode / or VSCode with Flutter extension
- Git

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sadexx79/Weatheree.git
   cd weatheree

2. **Install dependencies**
   ```bash
    flutter pub get

3.**Obtain an API key**

-Register at OpenWeatherMap

-Copy your API key.

4.**Add API key**

-Open lib/main.dart or lib/services/weather_service.dart.

-Replace 'YOUR_API_KEY' with your actual key.

5-**Run the app**
```bash
   flutter run

