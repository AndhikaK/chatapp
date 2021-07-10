import 'package:chatapp/pages/new_chat/contact_widget.dart';
import 'package:chatapp/pages/new_contact_page.dart';
import 'package:chatapp/service/custom_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat/chat_page.dart';
import 'new_group_page.dart';

class NewChat extends StatefulWidget {
  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final User _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _friendsStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.email)
        .collection('friends')
        .snapshots();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(CustomLocalizations.of(context).newChatText),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(CustomLocalizations.of(context).newGroupText),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewGroup()));
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(CustomLocalizations.of(context).newContactText),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewContactPage()));
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 5, 0, 5),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[350],
            child: Text(
              CustomLocalizations.of(context).selectFromContactText,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: _friendsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return new ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return new ContactWidget(
                        name: data['name'],
                        email: data['email'],
                        profileImage: data['profile-img'],
                        signature: data['signature'],
                      );
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
