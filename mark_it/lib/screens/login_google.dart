// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'home.dart';

// class Login_Google extends StatefulWidget {
//   @override
//   _Login_GoogleState createState() => _Login_GoogleState();
// }

// class _Login_GoogleState extends State<Login_Google> {
//   final GoogleSignIn googleSignIn = new GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences preferences;
//   bool loading = false;
//   bool isLoggedin = false;

//   void initState() {
//     super.initState();
//     isSignedIn();
//   }

//   void isSignedIn() async {
//     setState(() {
//       loading = true;
      
//     });

//     preferences = await SharedPreferences.getInstance();
//     isLoggedin = await googleSignIn.isSignedIn();
//     if(isLoggedin){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
//     }
//     setState(() {
//       loading = false;

//     });
//   }

//   Future handleSignIn() async{
//     preferences = await SharedPreferences.getInstance();
//     setState(() {
//       loading=true;

//     });
//     GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
//     AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
//     FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)) as FirebaseUser;

//     if(firebaseUser != null){
//       final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo:firebaseUser.uid).getDocuments();
//       final List<DocumentSnapshot> documents = result.documents;
//       if(documents.length ==0 ){
//         //insert user to collection
//         Firestore.instance.collection("users").document(firebaseUser.uid).setData( {
//           "id": firebaseUser.uid,
//           "userName": firebaseUser.displayName,
//           "profilePic":firebaseUser.photoUrl,

          
//         });

//         await preferences.setString("id", firebaseUser.uid);
//         await preferences.setString("userName", firebaseUser.displayName);
//         await preferences.setString("photoUrl", firebaseUser.photoUrl);
//       }
//       else{
//         await preferences.setString("id", documents[0]['id']);
//         await preferences.setString("userName", documents[0]['userName']);
//         await preferences.setString("photoUrl", documents[0]['photoUrl']);

//       }

//       Fluttertoast.showToast(msg: "LogIn was successful");
//       setState(() {
//         loading = false;

//       });

//     }
//     else{

//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
