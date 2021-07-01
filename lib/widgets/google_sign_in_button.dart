import 'package:chatapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // context.read<AuthenticationServices>().signInWithGoogle();
        Auth().signInWithGoogle(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      icon: SvgPicture.asset(
        'assets/svg/google-icon.svg',
        height: 20,
        width: 20,
      ),
      label: Text(
        "Sign In with Google",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
