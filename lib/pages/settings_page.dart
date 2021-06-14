// import 'package:chatapp/pages/change_password_page.dart';
import 'package:chatapp/pages/detail_profile_page.dart';
// import 'package:chatapp/pages/edit_detail_page.dart';
// import 'package:chatapp/pages/welcome_page.dart';
import 'package:chatapp/service/auth.dart';
import 'package:chatapp/service/custom_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(CustomLocalizations.of(context).settingsText),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(CustomLocalizations.of(context).profileText),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailProfilePage()),
                  );
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text(CustomLocalizations.of(context).changePasswordText),
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
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    CustomLocalizations.of(context).noText,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Auth().resetPassword(
                                        FirebaseAuth.instance.currentUser.email,
                                        context);
                                  },
                                  child: Text(
                                    CustomLocalizations.of(context).yesText,
                                  ),
                                ),
                              ],
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(16.0)),
                              title: Text(
                                CustomLocalizations.of(context)
                                    .passwordResetText,
                                style: TextStyle(fontSize: 19),
                              ),
                              content: Container(
                                height: 40,
                                child: Text(
                                  CustomLocalizations.of(context)
                                      .changeYourPasswordText,
                                  style: TextStyle(fontSize: 15),
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
                title: Text(CustomLocalizations.of(context).logoutText),
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
