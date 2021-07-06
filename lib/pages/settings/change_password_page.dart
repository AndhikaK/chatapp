import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              icon: Icon(Icons.help_outline_rounded),
              onPressed: () async {
                await _showDialog(context);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height * 1 / 2,
          padding: EdgeInsets.fromLTRB(15, 80, 15, 50),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  onPressed: () {},
                  // color: Colors.red,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Text(
                      "Send Email",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future _showDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alert!!"),
        content: new Text("You are awesome!"),
        actions: <Widget>[
          // ignore: deprecated_member_use
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
