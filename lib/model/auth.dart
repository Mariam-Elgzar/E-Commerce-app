import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authentication{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user  => _auth.currentUser;
      Future signUp({
    required String email,
    required String password,
}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      if (_auth.currentUser?.emailVerified==false){
        await _auth.currentUser?.sendEmailVerification();
      }
      return null;
    }
    on FirebaseAuthException catch (e){
      return e.message;
    }
  }
  Future logIn({
    required String email,
    required String password,
}) async {
        try{
          await _auth.signInWithEmailAndPassword(
              email: email,
              password: password
          );
          if(_auth.currentUser?.emailVerified==false){
            await _auth.currentUser?.sendEmailVerification();
            return 1;
          }
          return null;
        }on FirebaseAuthException catch(e){
          return e.message;
        }
  }
  Future resetPassword({
    required String email,
})async{
        try{
          await _auth.sendPasswordResetEmail(
              email: email
          );
          return null;
        }on FirebaseAuthException catch(e){
          return e.message;
        }
  }
  Future logOut()async{
        await _auth.signOut();
        print("logged out");
  }
}
