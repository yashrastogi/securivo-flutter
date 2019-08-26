import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:securivo/screens/home/home.dart';

class Login extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final Firestore _db = Firestore.instance;

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication;
    FirebaseUser user;
    if (googleSignInAccount == null) {
      return null;
    } else {
      googleSignInAuthentication = await googleSignInAccount.authentication;
    }
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    user = (await _auth.signInWithCredential(credential)).user;
    updateUserData(user);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    googleSignIn.signOut();
    _auth.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FirebaseUser>(
        future: _auth.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                print(snapshot.error);
                return null;
              }
              if (snapshot.data != null) {
                return Home();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        signIn().then((onValue) =>
                            Navigator.pushReplacementNamed(context, '/home'));
                      },
                      child: Text('Login with Google'),
                    ),
                  )
                ],
              );
            default:
              print('Loading\n');
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        signIn().then((onValue) =>
                            Navigator.pushReplacementNamed(context, '/home'));
                      },
                      child: Text('Login with Google'),
                    ),
                  )
                ],
              );
          }
        },
      ),
    );
  }
}
