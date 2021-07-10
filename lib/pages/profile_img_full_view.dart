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
            child: imageUrl == ""
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(70),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.white70,
                    ),
                  )
                : Image.network(
                    "${imageUrl}",
                    fit: BoxFit.cover,
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
