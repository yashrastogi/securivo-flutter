import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:securivo/auth.dart';

// class Profile extends StatefulWidget {
//   @override
//   ProfileState createState() => ProfileState();
// }

class Profile extends StatelessWidget {
  FirebaseUser user;
  Profile(FirebaseUser user) {
    this.user = user;
    // print('Signed in FirebaseUser:');
    // print(user);
  }
  // void getUser() async {
  //   user = (await auth.currentUser());
  //   // print(user);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // authService.user.listen((state) => setState(() => _profile = state));
  //   print("Hello "+_profile.toString());
  // }
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
