import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  FirebaseUser user;
  Profile(FirebaseUser user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 50,
            )),
      ],
    );
  }
}
