import 'package:chatapp/service/custom_localization.dart';
import 'package:chatapp/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchUserController = TextEditingController();

  Map<String, dynamic> _userContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          CustomLocalizations.of(context).newContactText,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _searchUserController,
                onFieldSubmitted: (value) async {
                  print(value);
                  try {
                    var ref = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(value)
                        .get();

                    if (ref.exists) {
                      print("data exist on firestore");
                      setState(() {
                        _userContact = ref.data();
                      });
                    } else {
                      print("data does not exist on firestore T_T");
                      setState(() {
                        _userContact = null;
                      });
                    }
                  } catch (e) {}
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _searchUserController.text = "";
                    },
                    child: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _userContact == null
                  ? Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 100,
                            color: Colors.red[300],
                          ),
                          SizedBox(height: 20),
                          Text("Contact not found!"),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                color: Colors.grey[400],
                                width: 5,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(55),
                                child: _userContact['profile-img'] == ""
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
                                        "${_userContact['profile-img']}",
                                        width: 110,
                                        height: 110,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _userContact['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _userContact['email'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    try {
                      print("add contact success");
                      Database().addContact(_userContact);
                    } catch (e) {
                      print("add contact failed : $e");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                  ),
                  child: Text("Add Contact")),
            ],
          ),
        ),
      ),
    );
  }
}
