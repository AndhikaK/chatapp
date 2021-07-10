import 'package:chatapp/service/database.dart';
import 'package:flutter/material.dart';

class SettingsEditSignaturePage extends StatefulWidget {
  @override
  _SettingsEditSignaturePageState createState() =>
      _SettingsEditSignaturePageState();
}

class _SettingsEditSignaturePageState extends State<SettingsEditSignaturePage> {
  final _formKey = GlobalKey<FormState>();
  final signatureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Signature"),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: signatureController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a signature";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  hintText: "Signature",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    try {
                      Database().editSignature(signatureController.text);
                      print("Edit signature (success)");
                    } catch (e) {
                      print("Edit signature (ERROR): $e");
                    }
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                ),
                child: Text(
                  "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
