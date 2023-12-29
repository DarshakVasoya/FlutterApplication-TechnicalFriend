import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';

class ComRating extends StatefulWidget {
  var data, count;
  ComRating(var data, int count) {
    this.data = data;
    this.count = count;
  }
  @override
  _ComRatingState createState() => _ComRatingState();
}

class _ComRatingState extends State<ComRating> {
  var width, data1;
  int count1;
  bool check = false;
  var data_snap = [];
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  void initState() {
    super.initState();
    data1 = widget.data;

    count1 = widget.count;
    setState(() {
      fetch1();
    });
  }

  Widget make(var name) {
    // width = MediaQuery.of(context).size.width;
    return Container(
        width: width / 3.5,
        height: width / 3.5,
        child: Container(
          margin: EdgeInsets.all(10),
          width: width / 4,
          height: width / 4,
          decoration: BoxDecoration(
              /* border: Border.all(
                // color: Colors.grey,
                width: 0.5,
              ),*/
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(child: Text(name)),
        ));
  }

  Widget make2(var number, bool check10) {
    //int num1 = int.parse(number * 10);
    //  print(num1);
    int num1 = 0;
    switch (number) {
      case "rating1":
        num1 = 1;
        break;
      case "rating2":
        num1 = 2;
        break;
      case "rating3":
        num1 = 3;
        break;
      case "rating4":
        num1 = 4;
        break;
      case "rating5":
        num1 = 5;
        break;
      case "rating6":
        num1 = 6;
        break;
      case "rating7":
        num1 = 7;
        break;
      case "rating8":
        num1 = 8;
        break;

      case "rating9":
        num1 = 9;
        break;

      case "rating10":
        num1 = 10;
        break;
    }
    return Container(
      width: width / 3.5,
      height: width / 3.5,
      child: Container(
        margin: EdgeInsets.all(10),
        width: width / 4,
        height: width / 4,
        decoration: BoxDecoration(
            /*border: Border.all(
              // color: Colors.grey,
              width: 0.5,
            ),*/
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: check10
                ? Text("No Data")
                : num1 == 0
                    ? Text("No Data")
                    : CircularPercentIndicator(
                        progressColor: num1 < 8
                            ? Colors.orange
                            : Colors.green[400], //color of progress
                        percent: num1 / 10, //
                        animation: true,
                        radius: width / 5,
                        lineWidth: 10, //size of border
                        circularStrokeCap: CircularStrokeCap.round,

                        backgroundColor:
                            num1 < 8 ? Colors.orange[100] : Colors.green[100],
                        center: Text(
                          "$num1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ), //text show mate
                      )),
      ),
    );
  }

  Future<void> fetch1() async {
    for (int i = 0; i < count1; i++) {
      data1[i] = data1[i].toString().replaceAll("slash", "/");
      data1[i] = data1[i].toString().replaceAll("point1", ".");

      // i++;
      await ref
          .child('Compare/Mobiles/${data1[i]}/ratings')
          .once()
          .then((DataSnapshot snap) {
        setState(() {
          data_snap.add(snap);
          check = true;
        });
        // print(data_snap[i].value("Camera Rating"));
        // }
      }).catchError((e) {
        print("error");
        final snackBar = SnackBar(content: Text("Check Your Network"));
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  var check_err1 = true, check_err2 = true, check_err3 = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    try {
      var extra = data_snap[0].value["Overall NDTV Rating"];
      setState(() {
        check_err1 = false;
      });
    } catch (e) {
      setState(() {
        check_err1 = true;
      });
    }
    try {
      var extra = data_snap[1].value["Overall NDTV Rating"];
      setState(() {
        check_err2 = false;
      });
    } catch (e) {
      setState(() {
        check_err2 = true;
      });
    }
    try {
      var extra = data_snap[2].value["Overall NDTV Rating"];
      setState(() {
        check_err3 = false;
      });
    } catch (e) {
      setState(() {
        check_err3 = true;
      });
    }

    return Container(
        // color: Colors.black,
        margin: EdgeInsets.all(10),
        child: check
            ? ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  //scrollDirection: Axis.vertical,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // Container(
                          //     width: width / 3.7,
                          //     height: width / 3.7,
                          //     child: Center(
                          //       child: Text("Mobile\nname"),
                          //     )),
                          make("Mobile\n name"),
                          make("Overall\n Rating"),
                          make("Design\n Rating"),
                          make("Display\n Rating"),
                          make("Software\n Rating"),
                          make("Performance \nRating"),
                          make("Battery\n Life\n Rating"),
                          make("Camera\n Rating"),
                          make("Value for\n Money\n Rating")
                        ],
                      ),
                    ),
                    widget.data[0] == ""
                        ? Container()
                        : check_err1
                            ? SingleChildScrollView(
                                child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      // height:
                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[0]),
                                      ),
                                    ),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                  ],
                                ),
                              ))
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,

                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[0]),
                                      ),
                                    ),
                                    make2(
                                        data_snap[0]
                                            .value["Overall NDTV Rating"],
                                        false),
                                    make2(data_snap[0].value["Design Rating"],
                                        false),
                                    make2(data_snap[0].value["Display Rating"],
                                        false),
                                    make2(data_snap[0].value["Software Rating"],
                                        false),
                                    make2(
                                        data_snap[0]
                                            .value["Performance Rating"],
                                        false),
                                    make2(
                                        data_snap[0]
                                            .value["Battery Life Rating"],
                                        false),
                                    make2(data_snap[0].value["Camera Rating"],
                                        false),
                                    make2(
                                        data_snap[0]
                                            .value["Value for Money Rating"],
                                        false),
                                  ],
                                ),
                              ),
                    widget.data[1] == ""
                        ? Container()
                        : check_err2
                            ? SingleChildScrollView(
                                child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,

                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[1]),
                                      ),
                                    ),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                  ],
                                ),
                              ))
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,

                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[1]),
                                      ),
                                    ),
                                    make2(
                                        data_snap[1]
                                            .value["Overall NDTV Rating"],
                                        false),
                                    make2(data_snap[1].value["Design Rating"],
                                        false),
                                    make2(data_snap[1].value["Display Rating"],
                                        false),
                                    make2(data_snap[1].value["Software Rating"],
                                        false),
                                    make2(
                                        data_snap[1]
                                            .value["Performance Rating"],
                                        false),
                                    make2(
                                        data_snap[1]
                                            .value["Battery Life Rating"],
                                        false),
                                    make2(data_snap[1].value["Camera Rating"],
                                        false),
                                    make2(
                                        data_snap[1]
                                            .value["Value for Money Rating"],
                                        false),
                                  ],
                                ),
                              ),
                    widget.data[2] == ""
                        ? Container()
                        : check_err3
                            ? SingleChildScrollView(
                                child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,

                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[2]),
                                      ),
                                    ),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                    make2(0, true),
                                  ],
                                ),
                              ))
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,

                                      width: width / 3.7,
                                      height: width / 3.7,
                                      child: Center(
                                        child: Text(widget.data[2]),
                                      ),
                                    ),
                                    make2(
                                        data_snap[2]
                                            .value["Overall NDTV Rating"],
                                        false),
                                    make2(data_snap[2].value["Design Rating"],
                                        false),
                                    make2(data_snap[2].value["Display Rating"],
                                        false),
                                    make2(data_snap[2].value["Software Rating"],
                                        false),
                                    make2(
                                        data_snap[2]
                                            .value["Performance Rating"],
                                        false),
                                    make2(
                                        data_snap[2]
                                            .value["Battery Life Rating"],
                                        false),
                                    make2(data_snap[2].value["Camera Rating"],
                                        false),
                                    make2(
                                        data_snap[2]
                                            .value["Value for Money Rating"],
                                        false),
                                  ],
                                ),
                              ),
                  ],
                ),
              ])
            : Loading());
  }
}
