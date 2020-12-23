import 'package:flutter/material.dart';
import 'package:hello_world/app/profile/profile_screen.dart';
import 'package:hello_world/app/sign_in/sign_in_screen.dart';
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
            return SignInScreen();
          } else {
            // rah deja me inscrit
            return ProfileScreen();
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
