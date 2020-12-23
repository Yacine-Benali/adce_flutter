import 'package:flutter/material.dart';
import 'package:hello_world/app/models/chat_user.dart';
import 'package:hello_world/services/api_path.dart';
import 'package:hello_world/services/firestore_service.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({Key key, this.uid}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;
  String bio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3amar swlhk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'kteb ismek',
              ),
              onChanged: (String value) {
                name = value;
              },
            ),
            Container(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'kteb kech haja',
              ),
              onChanged: (String value) {
                bio = value;
              },
            ),
            Container(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                ChatUser newUser = ChatUser(
                  aboutMe: bio,
                  username: name,
                  photoUrl: null,
                  id: widget.uid,
                );
                FirestoreService database = FirestoreService();
                database.setData(
                    path: APIPath.userDocument(widget.uid),
                    data: newUser.toMap(),
                    merge: false);
              },
              child: Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
