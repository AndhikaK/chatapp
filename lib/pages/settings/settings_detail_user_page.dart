import 'dart:ui';

import 'package:chatapp/pages/settings/settings_get_photo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../profile_img_full_view.dart';

class SettingsDetailUserPage extends StatefulWidget {
  @override
  _SettingsDetailUserPageState createState() => _SettingsDetailUserPageState();
}

class _SettingsDetailUserPageState extends State<SettingsDetailUserPage> {
  final User _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String _email = _currentUser.email;

    print(_email);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.red[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[200],
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                    child: Image.asset(
                      "assets/img/cute.jpeg",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // round profile image
                Positioned.fill(
                  top: -30,
                  child: Align(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return ProfileImgFullView(
                            imageUrl: "assets/img/cute.jpeg",
                            tag: "profile_img",
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                            color: Colors.grey[400],
                            // width: 5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            "assets/img/cute.jpeg",
                            fit: BoxFit.cover,
                            height: 140,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  bottom: 30,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(
                        Icons.photo,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsGetPhotoPage()));
                      },
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
          ],
        ),
      ),
    );
  }
}
