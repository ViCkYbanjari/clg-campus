import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university/features/colors.dart';
import 'package:university/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('fullName') ?? "Guest";
      userEmail = prefs.getString('username') ?? "";
    });
  }

  final user = FirebaseAuth.instance.currentUser;
  String userName = "Guest";
  String userEmail = "";

  _logout() async {
    await FirebaseAuth.instance.signOut();
    print('Logout tapped');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('username');
    // Clear other necessary preferences

    if (!mounted) return;

    // Navigate to the Splash Screen and clear the stack
    // The Splash screen will then decide to go to Login1
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Login1(),
      ), // Navigate to Splash
      (Route<dynamic> route) => false,
    );
  }

  // Example state for a setting
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';

  // --- Methods to handle taps ---
  void _editProfile() {
    print('Edit Profile tapped');
    // Navigate to an edit profile screen or show a dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Edit Profile Screen')),
    );
  }

  void _navigateToNotifications() {
    print('Notifications tapped');
    // Navigate to notification settings screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Notification Settings')),
    );
  }

  void _changeLanguage() {
    print('Language tapped');
    // Show a dialog to change language or navigate to language settings
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<String>(
                title: const Text('English'),
                value: 'English',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.of(context).pop(); // Close dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Language set to $_selectedLanguage'),
                    ),
                  );
                },
              ),
              RadioListTile<String>(
                title: const Text('Hindi'),
                value: 'Hindi',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.of(context).pop(); // Close dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Language set to $_selectedLanguage'),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToAbout() {
    print('About tapped');
    // Navigate to an about screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Navigate to About Screen')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor, // Using your defined background color
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: backgroundcolor,
        elevation: 0, // Remove app bar shadow if desired for flat look
      ),
      body: ListView(
        children: <Widget>[
          // --- User Profile Card (from your existing code) ---
          Card(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 10,
            ),
            elevation: 0.4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        // Replace with user image if available
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        // Use Expanded to prevent overflow if text is long
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${user!.email}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cardLightGreen1,
                      // Assuming this is defined in your colors.dart
                      foregroundColor: green,
                      // Assuming this is defined
                      elevation: 0.2,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ), // Make button full width
                    ),
                    onPressed: _editProfile,
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- General Settings Section ---
          _buildSettingsSectionTitle("General"),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Notifications ${value ? "Enabled" : "Disabled"}',
                    ),
                  ),
                );
              },
              activeColor: green, // Use your theme color
            ),
            onTap: () {
              // Optionally, you can also navigate or do something else on tap of the whole tile
              // For a switch, usually the switch itself handles the primary action.
              setState(() {
                _notificationsEnabled = !_notificationsEnabled;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Notifications ${!_notificationsEnabled ? "Enabled" : "Disabled"}',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text('Language'),
            trailing: Row(
              // To show current language and chevron
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  _selectedLanguage,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: _changeLanguage,
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Appearance'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              print('Appearance tapped');
              // Navigate to appearance settings (Dark Mode, Light Mode, System)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Navigate to Appearance Settings'),
                ),
              );
            },
          ),

          // --- Account Settings Section ---
          _buildSettingsSectionTitle("Account"),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text('Security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              print('Security Tapped');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigate to Security Settings')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              print('Privacy Policy Tapped');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Navigate to Privacy Policy Screen'),
                ),
              );
            },
          ),

          // --- Other Section ---
          _buildSettingsSectionTitle("Other"),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            trailing: const Icon(Icons.chevron_right),
            onTap: _navigateToAbout,
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red[700]),
            title: Text('Logout', style: TextStyle(color: Colors.red[700])),
            onTap: _logout,
          ),
          const SizedBox(height: 20), // Some spacing at the bottom
        ],
      ),
    );
  }

  // Helper widget to build section titles for better organization
  Widget _buildSettingsSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 8.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700], // Or use a color from your theme
        ),
      ),
    );
  }
}

// Ensure your color definitions are accessible (e.g., from university/features/colors.dart)
// Example placeholders for colors if not already defined:
// const Color backgroundcolor = Color(0xFFF5F5F5); // A light grey
// const Color cardLightGreen1 = Color(0xFFE8F5E9); // A light green
// const Color green = Colors.green;
