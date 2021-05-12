import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  var _settings = [
    {'icon': Icons.person, 'text': 'Profile'},
    {'icon': Icons.person, 'text': 'Profile'},
    {'icon': Icons.logout, 'text': 'Logout', 'method' : () }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: ListView.builder(
          itemCount: _settings.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(_settings[index]['icon']),
              title: Text(_settings[index]['text']),
            );
          },
        ),
      ),
    );
  }
}
