import 'package:flutter/material.dart';
import 'package:hello_world/app/conversations/conversations_screen.dart';
import 'package:hello_world/app/models/chat_user.dart';
import 'package:hello_world/app/profile/profile_screen.dart';
import 'package:hello_world/services/api_path.dart';
import 'package:hello_world/services/firestore_service.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key, this.uid}) : super(key: key);

  final String uid;

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  FirestoreService database = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: database.documentStream(
            path: APIPath.userDocument(widget.uid),
            builder: (data, documentId) {
              return ChatUser.fromMap(data, documentId);
            }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // document rah deja kayan
            return ConversationsScreeen();
          } else {
            // makanch document
            return ProfileScreen(
              uid: widget.uid,
            );
          }
        });
  }
}
