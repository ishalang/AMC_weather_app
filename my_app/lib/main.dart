import 'package:flutter/material.dart';
import 'screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Defining your hex color palette
    const Color baseColor = Color(0xFFECEEDF);
    const Color highlightColor = Color(0xFFBBDCE5);
    const Color fontColor = Color(0xFF0F0E0E);
    const Color headerColor = Color(0xFFCFAB8D);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
        // Set the app's background color to the base color (ECEEDF)
        scaffoldBackgroundColor: baseColor,

        // Configuration for general colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: highlightColor,
          primary: highlightColor,
          surface: baseColor,
        ),

        // Setting font colors and header colors
        textTheme: const TextTheme(
          // General body text (0F0E0E)
          bodyLarge: TextStyle(color: fontColor),
          bodyMedium: TextStyle(color: fontColor),

          // Header styles (CFAB8D)
          displayLarge: TextStyle(color: headerColor, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: headerColor, fontWeight: FontWeight.bold),
        ),

        // AppBar design using the header color
        appBarTheme: const AppBarTheme(
          backgroundColor: baseColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: headerColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: fontColor),
        ),
      ),
      home: const WeatherScreen(),
    );
  }
}
