import 'package:flutter/material.dart';

class ProfileImgFullView extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ProfileImgFullView({Key key, this.imageUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag,
            // child: CachedNetworkImage(
            //   width: MediaQuery.of(context).size.width,
            //   fit: BoxFit.contain,
            //   imageUrl: imageUrl,
            // ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
