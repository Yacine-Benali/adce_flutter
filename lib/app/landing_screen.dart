import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import 'package:hello_world/services/firebase_auth_service.dart';

class LandingScreen extends StatelessWidget {
  final FirebaseAuthService authService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        //  nevrifou l'etat te3 stream
        if (snapshot.connectionState == ConnectionState.active) {
          // nedou la donnée li raha f stream
          AuthUser user = snapshot.data;
          // verifi la donnée la null wala la
          if (user == null) {
            // user marahch me enregistrer
            return Container(
              color: Colors.red,
            );
          } else {
            // rah deja me inscrit
            return Container(
              color: Colors.blue,
            );
          }
        } else {
          // stream mazal ma ye9ele3
          return Scaffold(
            appBar: AppBar(),
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
