import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  final FirebaseUser user;
  Profile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 80,
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  child: Icon(Icons.people, color: Colors.grey[700]),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Padding(
                        child: Text(
                          user.displayName,
                          textScaleFactor: 1.15,
                        ),
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(new ClipboardData(text: user.uid));
                return Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Copied User Identifier!"),
                  duration: const Duration(seconds: 2),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      child: Icon(Icons.info, color: Colors.grey[700]),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'User ID',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Padding(
                            child: Text(
                              user.uid,
                              textScaleFactor: 1.15,
                            ),
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          ),
                        ],
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
