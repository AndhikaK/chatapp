import 'package:chatapp/pages/new_contact_page.dart';
import 'package:chatapp/service/custom_localization.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'new_group_page.dart';

class NewChat extends StatefulWidget {
  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  @override
  Widget build(BuildContext context) {
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
          // Container(
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.fromLTRB(12, 16, 0, 16),
          //   child: Column(
          //     children: [
          //       // GestureDetector(
          //       //   onTap: () {
          //       //     Navigator.push(
          //       //         context,
          //       //         MaterialPageRoute(
          //       //           builder: (context) => NewGroup(),
          //       //         ));
          //       //   },
          //       //   child: Row(
          //       //     children: [
          //       //       Icon(
          //       //         Icons.group,
          //       //         color: Colors.grey[700],
          //       //       ),
          //       //       SizedBox(
          //       //         width: 12,
          //       //       ),
          //       //       Text(
          //       //         "New Group",
          //       //         style: TextStyle(
          //       //             fontSize: 16,
          //       //             color: Colors.grey[700],
          //       //             fontWeight: FontWeight.bold),
          //       //       ),
          //       //     ],
          //       //   ),
          //       // ),
          //       Container(
          //         child: ListTile(
          //           leading: Icon(Icons.person),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         children: [
          //           Icon(
          //             Icons.person_add_alt_1,
          //             color: Colors.grey[700],
          //           ),
          //           SizedBox(
          //             width: 12,
          //           ),
          //           Text(
          //             "New Contact",
          //             style: TextStyle(
          //                 fontSize: 16,
          //                 color: Colors.grey[700],
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
            child: ListView(
              children: [
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
                NewChatBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewChatBox extends StatefulWidget {
  @override
  _NewChatBoxState createState() => _NewChatBoxState();
}

class _NewChatBoxState extends State<NewChatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Column(
        children: [
          Row(
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
                        "KI",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ));
                },
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kisuki",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Wanna play a game?",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
