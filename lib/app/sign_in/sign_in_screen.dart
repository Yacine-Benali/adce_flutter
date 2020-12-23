import 'package:flutter/material.dart';
import 'package:hello_world/services/firebase_auth_service.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            try {
              final FirebaseAuthService authService = FirebaseAuthService();
              authService.signInWithGoogle();
            } on Exception catch (e) {
              print(e);
            }
          },
          child: Text('sign in with google'),
        ),
      ),
    );
  }
}
