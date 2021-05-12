import 'package:flutter/material.dart';

import 'login_page.dart';
import 'register_page.dart';

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
                  "Connect",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                  ),
                ),
                Text(
                  "With Everyone",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                  ),
                ),
                Text(
                  "Don’t forget to say Hello to people you love!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
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
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Text('LOGIN'),
                      textColor: Colors.red,
                      color: Colors.white,),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return RegisterPage();
                            },
                          ),
                        );
                      },
                      child: Text('REGISTER'),
                      textColor: Colors.red,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}
