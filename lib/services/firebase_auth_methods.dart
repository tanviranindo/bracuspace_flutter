// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import '../utilities/showSnackBar.dart';
//
// class FirebaseAuthMethods {
//   final FirebaseAuth _firebaseAuth;
//
//   FirebaseAuthMethods(this._firebaseAuth);
//
//   User get user => _firebaseAuth.currentUser!;
//
//   Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
//
//   Future<void> signUpWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await sendEmailVerification(context);
//     } on FirebaseAuthException catch (e) {
//       // if you want to display your own custom error message
//       if (e.code == 'weak-password') {
//         if (kDebugMode) {
//           print('The password provided is too weak.');
//         }
//       } else if (e.code == 'email-already-in-use') {
//         if (kDebugMode) {
//           print('The account already exists for that email.');
//         }
//       }
//       showSnackBar(
//           context, e.message!); // Displaying the usual firebase error message
//     }
//   }
//
//   // EMAIL LOGIN
//   Future<void> loginWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (!user.emailVerified) {
//         await sendEmailVerification(context);
//         // restrict access to certain things using provider
//         // transition to another page instead of home screen
//       }
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Displaying the error message
//     }
//   }
//
//   // EMAIL VERIFICATION
//   Future<void> sendEmailVerification(BuildContext context) async {
//     try {
//       _firebaseAuth.currentUser!.sendEmailVerification();
//       showSnackBar(context, 'Email verification sent!');
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Display error message
//     }
//   }
// }
