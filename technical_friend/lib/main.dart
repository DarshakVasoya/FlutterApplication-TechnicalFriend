import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:technical_friend/About.dart';
import 'package:technical_friend/Compare01.dart';
import 'package:technical_friend/Loading.dart';
import 'package:technical_friend/News01.dart';
import 'dart:async';
import './Compare.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './Information.dart';
import './Suggestion.dart';
import './News.dart';
import './News1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
// import 'package:sha';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences pred;
// import ;
bool login = false;
Future<void> checking() async {
  pred = await SharedPreferences.getInstance();
  pred.containsKey("login") ? login = true : login = false;
}

// bool login = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      routes: {
        '/News1': (_) => News1(),
        '/Compare01': (_) => Compare01(),
      },
    );
  }
}

class First extends StatefulWidget {
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  void initState() {
    super.initState();
    checking();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Second())));
  }

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo1.png",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                "Technical Friend",
                style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ));
  }
}

class Second extends StatefulWidget {
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int _index1 = 0;
  var _Naviagaotor = [
    News(),
    Compare(),
    Suggestion(),
    Information(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(8),
          child: Image.asset(
            "images/logo1.png",
            // height: 10,
            // width: 10,
          ),
        ),
        title: Text(
          "Technical Friend ",
          style: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        iconTheme: new IconThemeData(color: Colors.black87),
      ),
      endDrawer: Drawer(
        elevation: 5,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            pred.getBool("login") != null
                ? UserAccountsDrawerHeader(
                    accountName: Text(pred.getString("name") ?? "unknown"),
                    accountEmail: Text(pred.getString("email") ?? " "),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        pred
                                .getString("name")
                                .substring(0, 1)
                                .toUpperCase()
                                .toString() ??
                            "",
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      ),
                    ),
                  )
                : DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange[300]),
                    child: Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ))),
                    )),
            //      rizontald,
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {
                Share.share("Search \"Technical Friend\" on PlayStore ");
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index1,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange[300],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            //on: Icon(Icons.compare_arrows,color:Colors.black,),
            title: Text(
              'News',
            ),
            // icon: Icons.
            icon: Icon(Icons.add_alert),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compare_arrows,
            ),
            title: Text('Comparision'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('Suggestion'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            title: Text('Information'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _index1 = index;
          });
        },
      ),
      body: _Naviagaotor[_index1],
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(Sing());

// class Sing extends StatefulWidget {
//   @override
//   _SingState createState() => _SingState();
// }

// class _SingState extends State<Sing> {
//   var _auth;
//   String email, pass;
//   void intState() {
//     _auth = FirebaseAuth.instance;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
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
//                     onPressed: () async {
//                       var o = await FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                               email: "darshakvasoya1310@gmail.com",
//                               password: "darshak1310");
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

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  String email, password;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Material(
                    color: Colors.white,

                    // margin: EdgeInsets.all(10),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "images/logo1.png",
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  Text(
                                    "Technical Friend",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 25),
                                  )
                                ])),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(10),
                          // height: 500,
                          decoration: BoxDecoration(
                              /*  border: Border.all(
                                      // color: Colors.grey,
                                      width: 0.5,
                                    ),*/
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                          //constraints: BoxConstraints.tightFor(height:150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  // obscureText: true,
                                  onChanged: (String value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText: 'Enter Email',
                                      filled: true,
                                      prefixIcon: Icon(Icons.person)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                  // obscureText: true,
                                  onChanged: (String value) {
                                    password = value;
                                  },
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Enter Password',
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          // color: Theme.of(conte,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      // isCollapsed: ,

                                      prefixIcon: Icon(Icons.vpn_key)),
                                ),
                              ),
                              RaisedButton(
                                textColor: Colors.white,
                                color: Colors.orange,
                                child: Text('Login'),
                                onPressed: () async {
                                  Fluttertoast.showToast(
                                    msg: "Loading...",
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                  );
                                  try {
                                    UserCredential a = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: password);

                                    pred.setBool("login", true);
                                    pred.setString("email", email);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Second()));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      Fluttertoast.showToast(
                                        msg:
                                            "Your Email Id or Password is wrong",
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                      );

                                      // Scaffold.of(context).showSnackBar(a);
                                    } else if (e.code == 'wrong-password') {
                                      Fluttertoast.showToast(
                                        msg:
                                            "Your Email Id or Password is wrong",
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg:
                                            "Your Email Id or Password is wrong",
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                      );
                                    }
                                  }
                                },
                              ),
                              RaisedButton(
                                textColor: Colors.black,
                                // color: Colors.blue,
                                child: Text('Sign Up'),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name, password, email;
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Material(
          color: Colors.white,
          // margin: EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "images/logo1.png",
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          Text(
                            "Technical Friend",
                            style: TextStyle(
                                decoration: TextDecoration.none, fontSize: 25),
                          )
                        ])),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  // height: 500,
                  decoration: BoxDecoration(
                      /*  border: Border.all(
                                      // color: Colors.grey,
                                      width: 0.5,
                                    ),*/
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  //constraints: BoxConstraints.tightFor(height:150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (String value) {
                            name = value;
                          },
                          // obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                              hintText: 'Enter Name',
                              filled: true,
                              prefixIcon: Icon(Icons.person_add)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          // obscureText: true,
                          onChanged: (String value) {
                            email = value;
                          },

                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter Email',
                              filled: true,
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (String value) {
                            password = value;
                          },
                          // obscureText: true,
                          obscureText: !_passwordVisible,

                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // color: Theme.of(conte,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              // isCollapsed: ,

                              prefixIcon: Icon(Icons.vpn_key)),
                        ),
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.orange,
                        child: Text('Sign Up'),
                        // onPressed: () {},
                        onPressed: () async {
                          Fluttertoast.showToast(
                            msg: "Loading...",
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                          );

                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);

                            pred.setBool("login", true);
                            pred.setString("name", "$name");
                            pred.setString("Email", "$email");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Second()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == "weak-password") {
                              Fluttertoast.showToast(
                                msg: "Your password is weak",
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                              );
                            } else if (e.code == "email-already-in-use") {
                              Fluttertoast.showToast(
                                msg: "This email is already used",
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: "Enter valid Email Id",
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                              );
                            }
                          } catch (e) {
                            // print(e);
                            Fluttertoast.showToast(
                              msg: "Enter valid email Id / Strong password",
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                            );
                          }
                        },
                      ),
                      RaisedButton(
                        textColor: Colors.black,
                        // color: Colors.blue,
                        child: Text('Login'),

                        onPressed: () async {
                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          } catch (e) {}
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
