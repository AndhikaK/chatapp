import 'dart:ui';

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
        child: SafeArea(
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
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                        child: Image.asset(
                          "assets/img/Logo_UnivLampung.png",
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // round profile image
                    Positioned.fill(
                      child: Align(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(165),
                            border: Border.all(
                              color: Colors.grey[400],
                              width: 5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(165),
                            child: Image.asset(
                              "assets/img/Logo_UnivLampung.png",
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          ),
                        ),
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
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text("Info and about"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
