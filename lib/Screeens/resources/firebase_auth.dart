import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Anonymous {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<model.Post> getPostdetails() async{

  // }
  Future<String> signIn() async {
    String res = "Some error occured!";

    try {
      //Register user

      UserCredential cred = await _auth.signInAnonymously();

      //Add user to user data base
      await _firestore.collection("users").doc(cred.user!.uid).set({});
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
