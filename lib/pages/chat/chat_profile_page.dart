import 'dart:ui';

import 'package:chatapp/pages/profile_img_full_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatProfilePage extends StatefulWidget {
  final String email;

  const ChatProfilePage({this.email});

  @override
  _ChatProfilePageState createState() => _ChatProfilePageState(this.email);
}

class _ChatProfilePageState extends State<ChatProfilePage> {
  _ChatProfilePageState(String email);

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> _targetProfile =
        FirebaseFirestore.instance
            .collection('users')
            .doc(widget.email)
            .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.red[400],
        elevation: 0,
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
                                          )),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            "${snapshot.data['name']}",
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
                            Container(
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
                            Container(
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
