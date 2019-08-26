import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:securivo/screens/home/home.dart';

class Login extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

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
    return user;
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
                print('\n\n\n$snapshot\n\n\n');
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
