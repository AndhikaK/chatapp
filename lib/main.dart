import 'package:chatapp/checkpage.dart';
import 'package:chatapp/pages/home_screen.dart';
import 'package:chatapp/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: WelcomePage(),
      // home: CheckPage(),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    // setState(() {});
    if (auth.currentUser != null) {
      print(FirebaseAuth.instance.currentUser.email);
      print(FirebaseAuth.instance.currentUser.uid);

      print("sedang login");

      return HomeScreen();
    } else {
      print("tidak sedang login");
      return WelcomePage();
    }
  }
}
