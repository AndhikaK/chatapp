import 'package:chatapp/pages/edit_detail_page.dart';
import 'package:chatapp/service/custom_localization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference _usersCollections =
        FirebaseFirestore.instance.collection('users');
    String _currentEmail = FirebaseAuth.instance.currentUser.email;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          title: Text(CustomLocalizations.of(context).profileText),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: _usersCollections.doc(_currentEmail).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            return (snapshot.data == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.redAccent),
                        alignment: Alignment.center,
                        height: 200,
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.redAccent),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data.get('name'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 25),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: InkWell(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.red.shade900,
                                        size: 20,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditDetailPage(
                                                email: _currentEmail,
                                                name: snapshot.data.get('name'),
                                                about:
                                                    snapshot.data.get('about'),
                                              ),
                                            ));
                                      }),
                                )
                              ],
                            ),
                            Text(
                              CustomLocalizations.of(context).joinedSinceText +
                                  /*  DateFormat('dd-MM-yyyy')
                                .format(
                                  DateTime.parse(
                                    snapshot.data.get('createdAt').toString(),
                                  ),
                                )
                                .toString(), */

                                  /* DateTime.parse(snapshot.data
                                    .get('createdAt')
                                    .toDate()
                                    .toString())
                                .toString(), */
                                  // '',
                                  snapshot.data
                                      .get('createdAt')
                                      .toDate()
                                      .toString()
                                      .substring(0, 10),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, top: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            CustomLocalizations.of(context).contactInfoText,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 19)),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(_currentEmail,
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(snapshot.data.get('about'),
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
          },
        ));
  }
}
