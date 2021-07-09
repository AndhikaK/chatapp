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
  @override
  Widget build(BuildContext context) {
    // setState(() {});
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
            /* Text(
              FirebaseAuth.instance.currentUser.email,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ), */
          ],
        ),
        /* title: Text(
          FirebaseAuth.instance.currentUser.uid,
          style: TextStyle(fontSize: 10),
        ), */
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
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: Container(
                    child: (document['email'] !=
                            FirebaseAuth.instance.currentUser.email)
                        ? HomeChatBox(
                            name: document['name'],
                            about: document['about'],
                            email: document['email'],
                          )
                        : Container(),
                  ),
                );
              }).toList(),
            );
          }),
      /* ListView(
        children: [
          HomeChatBox(),
          HomeChatBox(),
          HomeChatBox(),
          HomeChatBox(),
          HomeChatBox(),
          HomeChatBox(),
        ],
      ), */
    );
  }
}

class HomeChatBox extends StatefulWidget {
  String name, about, email;
  HomeChatBox({this.name, this.about, this.email});

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
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          widget.name.substring(0, 2).toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
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
