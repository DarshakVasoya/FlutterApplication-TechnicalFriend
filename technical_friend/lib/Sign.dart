// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(Sing());

// class Sing extends StatefulWidget {
//   @override
//   _SingState createState() => _SingState();
// }

// class _SingState extends State<Sing> {
//   var _auth;
//   void intState() {
//     _auth = FirebaseAuth.instance;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String email, pass = "df";

//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//             margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.person),
//                     hintText: 'Enter Email Id',
//                     labelText: 'Email',
//                   ),
//                   onChanged: (String value) {
//                     setState(() {
//                       email = value;
//                     });
//                   },
//                 ),
//                 TextField(
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.vpn_key),
//                     hintText: 'Enter Password',
//                     labelText: 'Password',
//                   ),
//                   onChanged: (String value) {
//                     setState(() {
//                       pass = value;
//                     });
//                   },
//                 ),
//                 FlatButton(
//                     onPressed: () {
//                       //   var o = await FirebaseAuth.instance
//                       //       .createUserWithEmailAndPassword(
//                       //           email: "darshakvasoya1310@gmail.com",
//                       //           password: "darshak1310");

//                       print(pass);
//                     },
//                     child: Container(
//                       color: Colors.orange,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ))
//               ],
//             )),
//       ),
//     );
//   }
// }
