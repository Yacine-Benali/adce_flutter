import 'package:flutter/material.dart';
import 'package:hello_world/app/models/chat_user.dart';
import 'package:hello_world/services/firestore_service.dart';

class ConversationsScreeen extends StatefulWidget {
  @override
  _ConversationsScreeenState createState() => _ConversationsScreeenState();
}

class _ConversationsScreeenState extends State<ConversationsScreeen> {
  FirestoreService database = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: database.collectionStream(
          path: 'users',
          builder: (data, documentId) => ChatUser.fromMap(data, documentId),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ChatUser> listaTe3lesT = snapshot.data;
            // rah kayan users
            return Scaffold(
                appBar: AppBar(
                  title: Text('titre'),
                ),
                body: Column(
                  children: [
                    ListTile(
                      title: Text(listaTe3lesT[0].username),
                      subtitle: Text(listaTe3lesT[0].aboutMe),
                    ),
                    ListTile(
                      title: Text(listaTe3lesT[1].username),
                      subtitle: Text(listaTe3lesT[1].aboutMe),
                    ),
                  ],
                ));
          } else {
            // makanch users
            return Container(
              color: Colors.red,
            );
          }
        });
  }
}
