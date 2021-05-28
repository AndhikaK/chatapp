import 'package:chatapp/pages/change_password_page.dart';
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
                onTap: () async {
                  // ChangePassword();
                  await showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionBuilder: (context, a1, a2, widget) {
                        final curvedValue =
                            Curves.easeInOutBack.transform(a1.value) - 1.0;
                        return Transform(
                          transform: Matrix4.translationValues(
                              0.0, curvedValue * 200, 0.0),
                          child: Opacity(
                            opacity: a1.value,
                            child: AlertDialog(
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(16.0)),
                              title: Text(
                                'Password reset',
                                style: TextStyle(fontSize: 19),
                              ),
                              content: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.lightGreen,
                                      size: 60,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Please check your email',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 200),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder:
                          // ignore: missing_return
                          (context, animation1, animation2) {});
                },
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
