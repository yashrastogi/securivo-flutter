import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../download/download.dart';
import '../upload/upload.dart';
import '../profile/profile.dart';
import '../login/login.dart';

FirebaseUser user;

class Home extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Login().signOut();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.account_circle)),
                  Tab(icon: Icon(Icons.add)),
                  Tab(icon: Icon(Icons.cloud_download))
                ],
              ),
              title: Text(appName),
            ),
            body: TabBarView(children: <Widget>[
              FutureBuilder<FirebaseUser>(
                future: auth.currentUser(),
                builder: (BuildContext context,
                    AsyncSnapshot<FirebaseUser> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return null;
                      }
                      return Profile(snapshot.data);
                    default:
                      return Container();
                  }
                },
              ),
              FutureBuilder<FirebaseUser>(
                future: auth.currentUser(),
                builder: (BuildContext context,
                    AsyncSnapshot<FirebaseUser> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return null;
                      }
                      return Upload(snapshot.data);
                    default:
                      return Container();
                  }
                },
              ),
              FutureBuilder<FirebaseUser>(
                future: auth.currentUser(),
                builder: (BuildContext context,
                    AsyncSnapshot<FirebaseUser> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return null;
                      }
                      return Download(snapshot.data);
                    default:
                      return Container();
                  }
                },
              ),
            ])));
  }
}
