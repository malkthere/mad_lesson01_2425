import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SettingsPage());
}
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  bool _darkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Method to load saved settings
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _darkModeEnabled = prefs.getBool('darkMode') ?? false;
    });
  }

  // Method to save settings
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setBool('darkMode', _darkModeEnabled);
    print('Settings saved');
  }

  // Method to Delete settings
  Future<void> _clearSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); // Remove username
    await prefs.remove('darkMode'); // Remove dark mode preference
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: _darkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _saveSettings,
                    child: Text('Save Settings'),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: _clearSettings,
                    child: Text('clear setting'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}