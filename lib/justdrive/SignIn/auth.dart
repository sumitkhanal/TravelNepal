// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:travelnepal/justdrive/SignIn/user.dart';

// class AuthMethods{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User _userFromFirebaseUser(FirebaseUser user){
//     return user !=null ? User(userId: user.uid, emailId: user.email) : null ;
//   }
//   Future signInWithEmailAndPassword(String email, String password) async{

//     try{
//       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       FirebaseUser firebaseUser = result.user;
//       return _userFromFirebaseUser(firebaseUser);
//     }catch(e){
//       print(e.toString());
//     }
//   }

//   Future<User> currentUser() async {
//     final user = await _auth.currentUser();
//     return _userFromFirebaseUser(user);
//   }

//   Future signUpwithEmailAndPassword(String email, String password) async{
//     try{
//       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       FirebaseUser firebaseUser = result.user;
//       return _userFromFirebaseUser(firebaseUser);
//     }catch(e){
//       print(e.toString());
//     }
//   }

//   Future resetPass(String email) async{
//     try{
//       return await _auth.sendPasswordResetEmail(email: email);
//     }catch(e){
//       print(e.toString());
//     }
//   }

//   Future signOut() async{
//     try{
//       return _auth.signOut();
//     }catch(e){
//       print(e.toString()) ;
//     }
//   }
// }