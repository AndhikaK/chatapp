// import 'package:chatapp/checkpage.dart';
import 'package:chatapp/pages/authentication/welcome_page.dart';
import 'package:chatapp/pages/home_screen.dart';
import 'package:chatapp/service/auth.dart';
import 'package:chatapp/service/custom_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        const CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('id', ''),
      ],
      debugShowCheckedModeBanner: false,

      // home: WelcomePage(),
      // home: CheckPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          }
          final user = snapshot.data;
          if (user != null) {
            print('akun masuk');
            return HomeScreen();
          } else {
            print('akun belum masuk');
            return SplashScreen();
          }
        },
      ),
    );
  }
}
