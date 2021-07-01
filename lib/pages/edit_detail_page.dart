import 'package:chatapp/service/custom_localization.dart';
import 'package:chatapp/service/database.dart';
import 'package:flutter/material.dart';

class EditDetailPage extends StatefulWidget {
  String email, name, about;
  EditDetailPage({this.email, this.name, this.about});

  @override
  _EditDetailPageState createState() => _EditDetailPageState();
}

class _EditDetailPageState extends State<EditDetailPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _aboutController = new TextEditingController();

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
                      initialValue: _nameController.text,
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
                      initialValue: _aboutController.text,
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
                    },
                    child: Text('save'))
              ],
            ),
          ),
        ));
  }
}
