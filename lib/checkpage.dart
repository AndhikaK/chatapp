import 'package:chatapp/pages/change_password_page.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/home_screen.dart';
import 'package:chatapp/pages/new_chat_pages.dart';
import 'package:chatapp/pages/new_group_page.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text("Home Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewChat(),
                  ),
                );
              },
              child: Text("New Chat Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewGroup(),
                  ),
                );
              },
              child: Text("New Group Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              },
              child: Text("Chat Page Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword(),
                  ),
                );
              },
              child: Text("Change Password Page"),
            ),
          ],
        ),
      ),
    );
  }
}
