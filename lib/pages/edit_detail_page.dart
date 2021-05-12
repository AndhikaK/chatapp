import 'package:flutter/material.dart';

class EditDetailPage extends StatefulWidget {
  @override
  _EditDetailPageState createState() => _EditDetailPageState();
}

class _EditDetailPageState extends State<EditDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
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
                child: Text('Your name', style: TextStyle(color: Colors.red)),
              ),
              Container(
                child: ListTile(
                  title: TextFormField(
                    initialValue: 'Kissuki',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0),
                alignment: Alignment.centerLeft,
                child: Text('About', style: TextStyle(color: Colors.red)),
              ),
              Container(
                child: ListTile(
                  title: TextFormField(
                    initialValue: 'Smile!! will happen',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              )
            ],
          ),
        ));
  }
}
