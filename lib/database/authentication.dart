import 'package:firebase_auth/firebase_auth.dart';

class Authentication{

  final FirebaseAuth authenticate = FirebaseAuth.instance;

  MyUser getUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? MyUser(firebaseUser.uid, firebaseUser.displayName) : null;
  }

  Stream<MyUser> get user {
    return authenticate.onAuthStateChanged.map(getUser);
  }

  Future signInEmailAndPassword(String email, String pass) async {
    try {
      AuthResult result = await authenticate.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String email, String pass) async {
    try {
      AuthResult result = await authenticate.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }





}




class MyUser{
String uid;
String name;
String bloodType;

MyUser(String uid, String name);



void setBloodType(String bloodType){
 this.bloodType = bloodType;
}


}