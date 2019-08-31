import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  final FirebaseUser user;
  Upload({Key key, @required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UploadState();
  }

}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    print("Found user: ${widget.user.displayName}\n");
    var itemArr = [
      'Albania',
      'Andorra',
      'Armenia',
      'Austria',
      'Azerbaijan',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Georgia',
      'Germany',
      'Greece',
      'Hungary',
      'Iceland',
      'Ireland',
      'Italy',
      'Kazakhstan',
      'Kosovo',
      'Latvia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Macedonia',
      'Malta',
      'Moldova',
      'Monaco',
      'Montenegro',
      'Netherlands',
      'Norway',
      'Poland',
      'Portugal',
      'Romania',
      'Russia',
      'San Marino',
      'Serbia',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden',
      'Switzerland',
      'Turkey',
      'Ukraine',
      'United Kingdom',
      'Vatican City'
    ];
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: itemArr.length,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.grey.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Container(
                          width: 300,
                          height: 80,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(itemArr[index], textScaleFactor: 2)]),
                        ),
                  )),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(14),
          child: SizedBox(
              width: 68,
              height: 68,
              child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.file_upload,
                    size: 30,
                  ))),
        ));
  }
}
