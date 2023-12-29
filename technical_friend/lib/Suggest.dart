import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:technical_friend/Compare02.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Suggest1.dart';
import 'package:technical_friend/Suggestion.dart';
import 'package:connectivity/connectivity.dart';

import 'package:firebase_admob/firebase_admob.dart';

class Suggest extends StatefulWidget {
  String name;
  Suggest(String name) {
    this.name = name;
  }
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  List suggestedList = [];
  var data;
  void dispose() {
    // super.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    RewardedVideoAd.instance.load(
      adUnitId: "ca-app-pub-9087629297377127/5854295436",
      targetingInfo: MobileAdTargetingInfo(keywords: [
        "Mobile",
        "Technology",
        "India",
        "Ecommerce",
        "Hindi",
        "Gujrati",
        "Movie"
      ]),
    );
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.closed) {
        RewardedVideoAd.instance.load(
          adUnitId: "ca-app-pub-9087629297377127/5854295436",
          targetingInfo: MobileAdTargetingInfo(keywords: [
            "Mobile",
            "Technology",
            "India",
            "Ecommerce",
            "Hindi",
            "Gujrati",
            "Movie"
          ]),
        );
      }
    };
    fetch1();
  }

  Future<void> fetch1() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
    } else {
      final snackBar = SnackBar(content: Text("Check Your Network Connection"));

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  var _selected = "Select";
  var _selected0 = "Select";
  var _selected1 = "Select";
  var _selected2 = "Select";
  var os = "Android";
  int _value = 10000;

  var priority = ["Select", "Performance", "Display", "Battery", "Camera"];
  var _con = TextEditingController();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextField(
              controller: _con,
              decoration: InputDecoration(
                prefix: Text(
                  "₹",
                  style: TextStyle(color: Colors.black),
                ),
                hintText: "Enter Your budget",
                border: OutlineInputBorder(
                  gapPadding: 10,
                  // borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text("Enter Your Budget(Max.)₹", textScaleFactor: 1.3),
          //       Stack(
          //         children: [
          //           Slider(
          //               min: 5000.0,
          //               max: 30000.0,
          //               divisions: 1000,
          //               activeColor: Colors.green,
          //               inactiveColor: Colors.orange,
          //               label: "$_value",
          //               value: _value.toDouble(),
          //               onChanged: (double newvalue) {
          //                 setState(() {
          //                   _value = newvalue.round();
          //                 });
          //               }),
          //           Container(
          //             margin: EdgeInsets.fromLTRB(5, 25, 0, 0),
          //             // color: Colors.black,
          //             child: Text("     | \n 5000"),
          //           ),
          //           Container(
          //             alignment: Alignment.bottomRight,
          //             width: MediaQuery.of(context).size.width - 30,
          //             margin: EdgeInsets.fromLTRB(5, 25, 0, 0),
          //             // color: Colors.black,
          //             child: Text("     | \n 30000"),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Operating System",
                        textScaleFactor: 1.3,
                      ),
                      Text(
                        " (Optional)",
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "Android",
                            groupValue: os,
                            onChanged: (var value) {
                              setState(() {
                                os = value;
                              });
                            },
                          ),
                          Text("Android"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "iOS",
                            groupValue: os,
                            onChanged: (var value) {
                              setState(() {
                                os = value;
                              });
                            },
                          ),
                          Text("iOS")
                        ],
                      )
                    ],
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                children: [
                  Text(
                    "Set Priority",
                    textScaleFactor: 1.3,
                  ),
                  Text(
                    " (Optional)",
                    textScaleFactor: 1,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 15,
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                            content: Text(
                                "Prioritize according to your requirement"));

                        Scaffold.of(context).showSnackBar(snackBar);
                      })
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_1),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 30,

                      // value: selected,
                      items: priority.map((var name) {
                        return DropdownMenuItem<String>(
                            value: name, child: Text(name));
                      }).toList(),
                      onChanged: (var name) {
                        setState(() {
                          this._selected = name;
                          // priority.remove(name);
                        });
                      },
                      value: _selected,
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_2),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 30,

                      // value: selected,
                      items: priority.map((var name) {
                        return DropdownMenuItem<String>(
                            value: name, child: Text(name));
                      }).toList(),
                      onChanged: (var name) {
                        setState(() {
                          this._selected0 = name;
                          // priority.remove(name);
                        });
                      },
                      value: _selected0,
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_3),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 30,

                      // value: selected,
                      items: priority.map((var name) {
                        return DropdownMenuItem<String>(
                            value: name, child: Text(name));
                      }).toList(),
                      onChanged: (var name) {
                        setState(() {
                          this._selected1 = name;
                          // priority.remove(name);
                        });
                      },
                      value: _selected1,
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_4),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: DropdownButton(
                      isExpanded: true,
                      iconSize: 30,

                      // value: selected,
                      items: priority.map((var name) {
                        return DropdownMenuItem<String>(
                            value: name, child: Text(name));
                      }).toList(),
                      onChanged: (var name) {
                        setState(() {
                          this._selected2 = name;
                          // priority.remove(name);
                        });
                      },
                      value: _selected2,
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () async {
                    RewardedVideoAd.instance.show();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Suggest1(_con.text, os,
                              _selected, _selected0, _selected1, _selected2)),
                    );
                    // Respond to button press
                  },
                  // icon: Icon(Icons.add, size: 18),
                  child: Text("Suggest"),
                ),
              )),
        ],
      ),
    ));
  }
}
