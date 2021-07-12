import 'package:chatapp/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String name;
  final String profileImage;
  final String signature;
  final String email;

  const ContactWidget(
      {this.name, this.profileImage, this.signature, this.email});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                name: name,
                // about: signature,
                email: email,
                profileImage: profileImage,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey[400],
                    // width: 5,
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: profileImage == ""
                        ? Container(
                            color: Colors.red[400],
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person,
                              size: 28,
                              color: Colors.white70,
                            ),
                          )
                        : Image.network(
                            "$profileImage",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[300], width: 1.5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${name}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${signature}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
