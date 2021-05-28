import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //FirebaseApp helloApp = Firebase.app('Hello Apps');

  signUp(String email, String password, BuildContext buildContext) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Text(
                    'Create account success',
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
                          'Please sign in',
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
          context: buildContext,
          pageBuilder:
              // ignore: missing_return
              (context, animation1, animation2) {});
      Navigator.pop(buildContext);
      // Navigator.pop(context);
      // User userDetail = userCredential.user;
      print("berhasil daftar");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        ScaffoldMessenger.of(buildContext).showSnackBar(
            SnackBar(content: Text('Weak password, minimum 6 characters')));
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text('email is still empty')));
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text('password is still empty')));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(buildContext).showSnackBar(
            SnackBar(content: Text('Please enter a valid email')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(buildContext).showSnackBar(
            SnackBar(content: Text('Email is already registered')));
        // print('The account already exists for that email.');
        /* await showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              final curvedValue =
                  Curves.easeInOutBack.transform(a1.value) - 1.0;
              return Transform(
                transform:
                    Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                child: Opacity(
                  opacity: a1.value,
                  child: AlertDialog(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0)),
                    title: Text(
                      'Cant create account',
                      style: TextStyle(fontSize: 19),
                    ),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 60,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'email is already registered',
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
            context: buildContext,
            pageBuilder:
                // ignore: missing_return
                (context, animation1, animation2) {}); */
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(String email, String password, BuildContext buildContext) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Future.delayed(const Duration(milliseconds: 500), () {
        RestartWidget.restartApp(buildContext);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text('User not found')));
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text('Wrong password')));
      } else {
        print(e.code);
      }
    }
  }

  logOut(BuildContext buildContext) async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(buildContext);
    });
  }

  resetPassword(String email, BuildContext buildContext) async {
    auth.sendPasswordResetEmail(email: email);
    await showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
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
        context: buildContext,
        pageBuilder:
            // ignore: missing_return
            (context, animation1, animation2) {});
    logOut(buildContext);
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}