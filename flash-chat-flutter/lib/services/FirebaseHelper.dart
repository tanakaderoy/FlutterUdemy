import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';

class FirebaseHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final Firestore _firestore = Firestore.instance;

  static Future<FirebaseUser> handleSignIn(String email,
      String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    return user;
  }

  static Future<FirebaseUser> handleRegister(String email,
      String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user;
  }

  static Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }

  static Future<void> logout() async {
    return await _auth.signOut();
  }

  static void sendMessage(String messageText, String sender) {
    _firestore
        .collection(kMessagesCollectionName)
        .add({'sender': sender, 'text': messageText});
  }

    static final messages = _firestore
        .collection(kMessagesCollectionName)
        .snapshots();

}
