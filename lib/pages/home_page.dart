import 'package:chatapp/pages/welcome_page.dart';
import 'package:chatapp/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        actions: [
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: null),
          IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              }),
        ],
      ),
    );
  }
}
