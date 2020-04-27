import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/model/user.dart';
import 'package:todo_list/services/database.dart';

class AuthHelper{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get userId{
  
    return _firebaseAuth.onAuthStateChanged
    .map(_incomingUser);
    
  }

  User _incomingUser(FirebaseUser firebaseUser) {
    if (userId != null) {
      return User(userId: firebaseUser.uid);
    } else {
      return null;
    }
  }

  // Login

  Future logIn(String email, String pass) async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser firebaseUser = result.user;
      return _incomingUser(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
Future register(String email,String pass) async{
  try{
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser firebaseUser = authResult.user;
    await DatabaseService(uid: firebaseUser.uid).updateUserData('0', 'John', 100);
    return _incomingUser(firebaseUser);
  }catch(e){
    print(e.toString());
    return null;
  }
}
  Future logOut() async {
    try{
      return await _firebaseAuth.signOut();
      }catch(e){
    print(e.toString());
    return null; 
    }
  }
 

  //Authenication Userchange

  
}