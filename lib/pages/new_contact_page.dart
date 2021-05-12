import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('New Contact'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              initialValue: 'Fikri',
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black38)),
                  suffixIcon: Icon(Icons.highlight_off_rounded)),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
