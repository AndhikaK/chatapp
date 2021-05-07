import 'package:chatapp/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text field text
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login to continue',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        this._email = value;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        this._password = value;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: null,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'forgot password?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<AuthenticationService>()
                          .signIn(_email.trim(), _password.trim());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
