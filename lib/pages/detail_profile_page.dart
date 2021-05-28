import 'package:flutter/material.dart';

class DetailProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          title: Text('Profile'),
        ),
        body: Column(
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
                    Text(
                      'Kissuki',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                    Text(
                      'Joined since 32 May 2022',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 15),
              alignment: Alignment.centerLeft,
              child: Text('Contact info',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 19)),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text('* Id',
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text('Smile!! and good thing will happen',
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}
