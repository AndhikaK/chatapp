import 'dart:ui';

import 'package:chatapp/pages/settings/settings_edit_signature_page.dart';
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
    Stream<DocumentSnapshot<Map<String, dynamic>>> _targetProfile =
        FirebaseFirestore.instance.collection('users').doc(_email).snapshots();

    print(_email);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.red[700],
      ),
      body: StreamBuilder(
          stream: _targetProfile,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              print("hasErrror : ${snapshot}");

              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              print("connection waiting : ${snapshot}");

              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
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
                          child: snapshot.data['profile-img'] == ""
                              ? Container(
                                  color: Colors.red[400],
                                )
                              : Image.network(
                                  "${snapshot.data['profile-img']}",
                                  width: 140,
                                  height: 140,
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return ProfileImgFullView(
                                  imageUrl: "${snapshot.data['profile-img']}",
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
                                child: snapshot.data['profile-img'] == ""
                                    ? Container(
                                        color: Colors.red[200],
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.person,
                                          size: 120,
                                          color: Colors.white70,
                                        ),
                                      )
                                    : Image.network(
                                        "${snapshot.data['profile-img']}",
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
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
                                      builder: (context) =>
                                          SettingsGetPhotoPage()));
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
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.red[300],
                            ),
                          ),
                          // Account item
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 15,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "${snapshot.data['email']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // signature container
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SettingsEditSignaturePage()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 15,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "${snapshot.data['about']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Signature",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
