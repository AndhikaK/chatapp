import 'package:chatapp/pages/home_screen.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print("sedang login");
      return HomeScreen();
    } else {
      print("tidak sedang login");
      return WelcomePage();
    }
  }
}
