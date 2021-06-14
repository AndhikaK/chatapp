import 'package:chatapp/service/custom_localization.dart';
import 'package:flutter/material.dart';

class NewGroup extends StatelessWidget {
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
        title: Text(CustomLocalizations.of(context).newGroupText),
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 7, 7, 7),
                    child: Text(
                      "Add Group Participants",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                    height: 50,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                        hintText: "Type Contact Name",
                        hintStyle: TextStyle(fontSize: 20),
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () {}),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                NewGroupBox(),
                NewGroupBox(),
                NewGroupBox(),
                NewGroupBox(),
                NewGroupBox(),
                NewGroupBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewGroupBox extends StatefulWidget {
  @override
  _NewGroupBoxState createState() => _NewGroupBoxState();
}

class _NewGroupBoxState extends State<NewGroupBox> {
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kisuki",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.check_rounded,
                  size: 14,
                ),
              )
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
