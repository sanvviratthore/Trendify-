import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'theme_provider.dart'; // Import ThemeProvider (adjust the path if needed)
import 'welcome_screen.dart'; // Import WelcomeScreen (adjust the path if needed)
import 'dashboard_screen.dart'; // Import DashboardScreen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trendify',
          theme: ThemeData.light(), // Light theme
          darkTheme: ThemeData.dark(), // Dark theme
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // Switch between light and dark mode
          home: WelcomeScreen(), // Set WelcomeScreen as the home screen
        );
      },
    );
  }
}