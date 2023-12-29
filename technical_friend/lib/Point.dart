import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';

class Point extends StatefulWidget {
  int mobile_no;
  List data = [];
  Point(this.data, this.mobile_no);
  _PointState createState() => _PointState();
}

class _PointState extends State<Point> {
  Map a = {};

  bool check = false;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  void iniState() {
    super.initState();
  }

  Future<void> fetch() async {
    for (int i = 0; i < widget.mobile_no; i++) {
      ref
          .child("Compare/Mobiles/${widget.data[i]}/point")
          .once()
          .then((DataSnapshot snap) {
        // print(snap.value.length);
        setState(() {
          if (snap.value != "No") {
            a["${widget.data[i]}"] = snap.value;
          } else {
            a["${widget.data[i]}"] = null;
          }
          check = true;
        });
      }).catchError((e) {
        a["${widget.data[i]}"] = null;
      });
    }
  }

  int length1;
  Widget build(BuildContext context) {
    fetch();
    return check
        ? SingleChildScrollView(
            child: Container(
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

                //   height: height,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),

                // padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    widget.data[0] != ""
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                child: Text(
                                  widget.data[0],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              make_table(widget.data[0])
                            ],
                          )
                        : Container(),
                    widget.data[1] != ""
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Text(
                                  widget.data[1],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              make_table(widget.data[1])
                            ],
                          )
                        : Container(),
                    widget.data[2] != ""
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Text(
                                  widget.data[2],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              make_table(widget.data[2])
                            ],
                          )
                        : Container(),
                  ],
                )),
          )
        : Container(
            child: Center(
              child: Loading(),
            ),
          );
  }

  Widget make_table(String name) {
    int good_len = 0;
    int bad_len = 0;
    if (a["$name"] != null) {
      good_len = a["$name"]["good"].length;
      bad_len = a["$name"]["bad"].length;
    }
    length1 = good_len <= bad_len ? good_len : bad_len;

    return a["$name"] != null
        ? DataTable(columns: [
            DataColumn(label: Text("Advantage")),
            DataColumn(label: Text("Disadvantage"))
          ], rows: [
            length1 > 0
                ? DataRow(cells: [
                    DataCell(Text(a[name]["good"][0])),
                    DataCell(Text(a[name]["bad"][0])),
                    // DataCell(Text('Actor')),
                  ])
                : DataRow(cells: [
                    DataCell(Text("-")),
                    DataCell(Text("-")),
                    // DataCell(Text('Actor')),
                  ]),
            length1 > 1
                ? DataRow(cells: [
                    DataCell(Text(a[name]["good"][1])),
                    DataCell(Text(a[name]["bad"][1])),
                    // DataCell(Text('Student')),
                  ])
                : DataRow(cells: [
                    DataCell(Text("-")),
                    DataCell(Text("-")),
                    // DataCell(Text('Actor')),
                  ]),
            length1 > 2
                ? DataRow(cells: [
                    DataCell(Text(a[name]["good"][2])),
                    DataCell(Text(a[name]["bad"][2])),
                    // DataCell(Text('Student')),
                  ])
                : DataRow(cells: [
                    DataCell(Text("-")),
                    DataCell(Text("-")),
                    // DataCell(Text('Actor')),
                  ]),
            length1 > 3
                ? DataRow(cells: [
                    DataCell(Text(a[name]["good"][3])),
                    DataCell(Text(a[name]["bad"][3])),
                    // DataCell(Text('Student')),
                  ])
                : DataRow(cells: [
                    DataCell(Text("-")),
                    DataCell(Text("-")),
                    // DataCell(Text('Actor')),
                  ]),
          ])
        : Text("No data Found");
  }
}
