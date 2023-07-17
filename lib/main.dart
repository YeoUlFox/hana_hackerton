import 'package:flutter/material.dart';
import 'package:hana_hackerton/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ColorScheme myCustomColorScheme = ColorScheme(
      primary: Color(0xFF20C997),         // main
      primaryVariant: Color(0xFF186D63),  // M5
      secondary: Color(0xFF0CA678),       // M4
      secondaryVariant: Color(0xFF63E6BE),// M2
      surface: Color(0xFFFAFBFB),         // M1
      background: Color(0xFFFAFBFB),      // background
      error: Color(0xFFF64949),           // Error
      onPrimary: Color(0xFF212529),       // N7
      onSecondary: Color(0xFF212529),     // N6
      onSurface: Color(0xFF212529),       // N4
      onBackground: Color(0xFF212529),    // N3
      onError: Color(0xFFFFFFFF),         // WHITE
      outline: Color(0xFF63E6BE),         // highlight
      brightness: Brightness.light, // 밝은 테마
    );

    return MaterialApp(
      title: 'Hana Reborn',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 48, fontWeight: FontWeight.bold), // h1
          headline2: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), // h2
          headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // h3
          headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // h4
          headline5: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // h5
          bodyText1: TextStyle(fontSize: 16),
          bodyText2: TextStyle(fontSize: 14),
        ),
        colorScheme: myCustomColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

