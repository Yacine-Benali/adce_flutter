import 'package:flutter/foundation.dart';

class AuthUser {
  AuthUser({
    @required this.uid,
  });
  final String uid;
}

abstract class Auth {
  Stream<AuthUser> get onAuthStateChanged;
  Future<AuthUser> currentUser();
  Future<AuthUser> signInWithGoogle();
  Future<void> signOut();
}
