import 'package:flutter/material.dart';
import 'package:hello_world/app/chat/chat_screen.dart';
import 'package:hello_world/app/models/chat_user.dart';
import 'package:hello_world/services/firebase_auth_service.dart';
import 'package:hello_world/services/firestore_service.dart';

class ConversationsScreeen extends StatefulWidget {
  const ConversationsScreeen({Key key, this.uid}) : super(key: key);

  final String uid;

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
            List<Widget> widgetsList = [];

            for (var user in listaTe3lesT) {
              if (user.id == widget.uid) {
              } else {
                widgetsList.add(
                  ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.aboutMe),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen();
                          },
                        ),
                      );
                    },
                  ),
                );
              }
            }
            // rah kayan users
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('titre'),
                  leading: IconButton(
                    onPressed: () {
                      FirebaseAuthService authService = FirebaseAuthService();
                      authService.signOut();
                    },
                    icon: Icon(Icons.exit_to_app),
                  ),
                ),
                body: Column(
                  children: widgetsList,
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
