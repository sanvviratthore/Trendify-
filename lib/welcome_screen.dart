import 'package:flutter/material.dart';
import 'package:myapp/dashboard_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Ensure a solid background color for visibility
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Black_and_Pink_Minimalist_Tropical_Flower_Head_Illustrated_Logo-removebg-preview.png',
              height: 350,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DashboardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,  // Text color
                backgroundColor: const Color.fromARGB(255, 247, 159, 226),  // Button color
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                _showTourDialog(context);  // Show a dialog or tour
              },
              child: Text(
                'Take a Tour',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  // Show a simple dialog for the tour
  void _showTourDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("App Tour"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Welcome to the app! Here's a quick tour:"),
              SizedBox(height: 10),
              Text("1. Home Screen: See your metrics and trends."),
              Text("2. Trends: View detailed analytics."),
              Text("3. Settings: Customize your preferences."),
              SizedBox(height: 10),
              Text("Enjoy exploring the app!"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close the tour
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}