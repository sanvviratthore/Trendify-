import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'theme_provider.dart'; // Import ThemeProvider

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Theme settings
            ListTile(
              title: Text('Theme'),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
            ),

            // Notifications settings
            ListTile(
              title: Text('Enable Notifications'),
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // Handle enabling/disabling notifications
                },
              ),
            ),

            // Language settings
            ListTile(
              title: Text('Language'),
              trailing: DropdownButton<String>(
                value: 'English',
                items: [
                  DropdownMenuItem(value: 'English', child: Text('English')),
                  DropdownMenuItem(value: 'Spanish', child: Text('Spanish')),
                  DropdownMenuItem(value: 'French', child: Text('French')),
                ],
                onChanged: (value) {
                  // Handle language change
                },
              ),
            ),

            // Account settings
            ListTile(
              title: Text('Account Settings'),
              onTap: () {
                _showAccountSettingsDialog(context);
              },
            ),

            // Privacy settings
            ListTile(
              title: Text('Privacy Settings'),
              onTap: () {
                _showPrivacySettingsDialog(context);
              },
            ),

            // App version
            ListTile(
              title: Text('App Version'),
              trailing: Text('1.0.0'),
            ),

            // Clear cache
            ListTile(
              title: Text('Clear Cache'),
              onTap: () {
                _showClearCacheDialog(context);
              },
            ),

            // Help and Support
            ListTile(
              title: Text('Help & Support'),
              onTap: () {
                // Navigate to help and support page (if implemented)
              },
            ),

            // Log out
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAccountSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Account Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Update Profile'),
                onTap: () {
                  // Handle profile update navigation
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Change Password'),
                onTap: () {
                  // Handle password change navigation
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showPrivacySettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Privacy Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Manage Permissions'),
                onTap: () {
                  // Handle permissions management navigation
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Reset Privacy Preferences'),
                onTap: () {
                  // Handle privacy preferences reset
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', // Replace '/' with your home route name
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Clear Cache'),
          content: Text('Are you sure you want to clear the cache?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}