import 'package:chatapp/pages/settings/settings_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat/chat_page.dart';
import 'new_chat_pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.email)
        .collection('chatrooms')
        .snapshots();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewChat(),
              ));
        },
        child: Icon(
          Icons.chat,
          size: 25,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Text(
              "Hello ",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              })
        ],
      ),
      body: StreamBuilder(
          stream: _chatStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Container();
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return new HomeChatBox(
                  name: data['receiver-name'],
                  about: data['message'],
                  email: data['receiver'],
                  profileImg: data['profile-img'],
                );
              }).toList(),
              // children: snapshot.data.docs.map((document) {
              //   return Center(
              //     child: Container(
              //         child: HomeChatBox(
              //       name: document['name'],
              //       about: document['about'],
              //       email: document['email'],
              //     )),
              //   );
              // }).toList(),
            );
          }),
    );
  }
}

class HomeChatBox extends StatefulWidget {
  String name, about, email, profileImg;
  HomeChatBox({this.name, this.about, this.email, this.profileImg});

  @override
  _HomeChatBoxState createState() => _HomeChatBoxState();
}

class _HomeChatBoxState extends State<HomeChatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      name: widget.name,
                      about: widget.about,
                      email: widget.email,
                    ),
                  ));
            },
            child: Row(
              children: [
                // Container(
                //   margin: EdgeInsets.only(right: 7),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(50),
                //     child: Container(
                //       width: 50,
                //       height: 50,
                //       color: Colors.red,
                //       child: Center(
                //         child: Text(
                //           widget.name.substring(0, 2).toUpperCase(),
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 20,
                //               fontWeight: FontWeight.w500),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.grey[400],
                        // width: 5,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: widget.profileImg == ""
                            ? Container(
                                color: Colors.red[400],
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.person,
                                  size: 28,
                                  color: Colors.white70,
                                ),
                              )
                            : Image.network(
                                "${widget.profileImg}",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          Container(
                            width: 70,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: Colors.lightBlue[300],
                                  size: 13,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "7:57 am",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.about,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 7, 0, 0),
            height: 1,
            width: MediaQuery.of(context).size.width - 50,
            color: Colors.grey[350],
          ),
        ],
      ),
    );
  }
}
