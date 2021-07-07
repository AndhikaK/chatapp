import 'dart:io';

import 'package:chatapp/service/custom_localization.dart';
import 'package:chatapp/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditDetailPage extends StatefulWidget {
  String email, name, about;
  EditDetailPage({this.email, this.name, this.about});

  @override
  _EditDetailPageState createState() => _EditDetailPageState();
}

class _EditDetailPageState extends State<EditDetailPage> {
  File image;
  String filename;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _aboutController = new TextEditingController();
  TextEditingController imageInputController;

  void createData() async {
    DateTime now = DateTime.now();
    String nuevoformato = DateFormat('kk:mm:ss:MMMMd').format(now);
    var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
    var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

    FirebaseAuth _auth = FirebaseAuth.instance;

    final Reference ref = FirebaseStorage.instance.ref().child(fullImageName);
    // ignore: unused_local_variable
    final UploadTask task = ref.putFile(image);

    var part1 =
        'https://firebasestorage.googleapis.com/v0/b/insta-app-8bc64.appspot.com/o/';

    var fullPathImage = part1 + fullImageName2;
    print(fullPathImage);

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db
          .collection('photos')
          .add({'name': _auth.currentUser.email, 'image': '$fullPathImage'});
      setState(() => id = ref.id);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(); //regrese a la pantalla anterior
        image = null;
      });
    }
  }

  pickerCam() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      image = File(img.path);
      setState(() {});
    }
  }

  pickerGallery() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      image = File(img.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    _nameController.text = widget.name;
    _aboutController.text = widget.about;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text(CustomLocalizations.of(context).profileText),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Stack(alignment: Alignment.center, children: [
                    CircleAvatar(
                      maxRadius: 70.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          color: Colors.red,
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        )),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      // CustomLocalizations.of(context).yourNameText,
                      'your name',
                      style: TextStyle(color: Colors.red)),
                ),
                Container(
                  child: ListTile(
                    title: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: Icon(Icons.face),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      // CustomLocalizations.of(context).aboutText,
                      'about',
                      style: TextStyle(color: Colors.red)),
                ),
                Container(
                  child: ListTile(
                    title: TextFormField(
                      controller: _aboutController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await Database().editUser(widget.email,
                          _nameController.text, _aboutController.text);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('save'))
              ],
            ),
          ),
        ));
  }
}
