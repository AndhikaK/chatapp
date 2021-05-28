import 'package:chatapp/pages/edit_detail_page.dart';
import 'package:chatapp/pages/welcome_page.dart';
import 'package:chatapp/service/auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditDetailPage()));
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('Change password'),
                onTap: null,
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Auth().logOut(context);
                  /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage())); */
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
