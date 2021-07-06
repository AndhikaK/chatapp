import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProfilePage extends StatefulWidget {
  @override
  _ChatProfilePageState createState() => _ChatProfilePageState();
}

class _ChatProfilePageState extends State<ChatProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[100],
          child: Column(
            children: [
              // image container
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: Image.asset(
                      "assets/img/Logo_UnivLampung.png",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Text(
                      "Kissuki",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "About and id",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
