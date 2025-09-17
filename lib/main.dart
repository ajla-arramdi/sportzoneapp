import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_screen.dart';
import 'widgets/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Station Zone',
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData(
        // Dark theme
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primaryCyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const MainScreen(),
    );
  }
}
