import 'package:chatapp/service/custom_localization.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/authentication/register_page.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.chat,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 130.0,
            ),
            Text(
              CustomLocalizations.of(context).welcomeMessage1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Text(
              CustomLocalizations.of(context).welcomeMessage2,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              CustomLocalizations.of(context).welcomeMessage3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return LoginPage();
                    //     },
                    //   ),
                    // );

                    // navigate to login with some animation
                    Navigator.of(context).push(_createRoute());
                  },
                  child:
                      Text(CustomLocalizations.of(context).login.toUpperCase()),
                  textColor: Colors.red,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                      CustomLocalizations.of(context).register.toUpperCase()),
                  textColor: Colors.red,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
