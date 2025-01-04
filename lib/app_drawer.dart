// lib/app_drawer.dart
import 'package:flutter/material.dart'; // Import HomePage
import 'package:myapp/dashboard_screen.dart';
import 'package:myapp/welcome_screen.dart';
import 'trendspage.dart'; // Import TrendsPage
import 'settings.dart'; // Import SettingsPage
import 'recommendations_page.dart'; // Import RecommendationsPage

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Trendify Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Home Menu Item
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
          ),
          // Trends Menu Item
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('Trends'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrendsPage()),
              );
            },
          ),
          // My Recommendations Menu Item
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text('My Recommendations'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendationsPage()),
              );
            },
          ),
          // Settings Menu Item
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
