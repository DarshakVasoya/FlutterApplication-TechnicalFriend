import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class topfive {
  String name;
  String value;
  topfive(this.name, this.value);
}

class Suggest1 extends StatefulWidget {
  var data = Set();
  Suggest1(var price, var os, var p1, var p2, var p3, var p4) {
    this.data.add(price);
    this.data.add(os);
    this.data.add(p1);
    this.data.add(p2);
    this.data.add(p3);
    this.data.add(p4);
    this.data.remove("Select");
  }
  @override
  _Suggest1State createState() => _Suggest1State();
}

class _Suggest1State extends State<Suggest1> {
  var main_d = [];
  var num1 = [];
  var price_data = Map();
  var data1;
  var mobile = [];
  var price;
  List<IconData> icon = [
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_4,
    Icons.filter_5,
    Icons.filter_6,
    Icons.filter_7,
    Icons.filter_8,
    Icons.filter_9
  ];
  var money = [];
  var rating = [];

  var data_price;
  List<topfive> main_data = [];
  int mobile_price;
  void initState() {
    super.initState();
    data_price = widget.data.toList();
    mobile_price = get_amount();
    fetch_data();
  }

  int get_amount() {
    int amount = int.parse(data_price.elementAt(0));
    if (amount <= 5000) {
      amount = 5000;
    } else if (amount <= 10000 && amount > 5000) {
      amount = 10000;
    } else if (amount <= 12000 && amount > 10000) {
      amount = 12000;
    } else if (amount <= 15000 && amount > 12000) {
      amount = 15000;
    } else if (amount <= 20000 && amount > 15000) {
      amount = 20000;
    } else if (amount <= 25000 && amount > 20000) {
      amount = 25000;
    } else if (amount <= 30000 && amount > 25000) {
      amount = 30000;
    } else if (amount <= 40000 && amount > 30000) {
      amount = 40000;
    } else if (amount <= 50000 && amount > 40000) {
      amount = 50000;
    } else if (amount <= 60000 && amount > 50000) {
      amount = 60000;
    } else if (amount <= 70000 && amount > 60000) {
      amount = 70000;
    } else if (amount <= 70000 && amount > 70000) {
      amount = 80000;
    } else if (amount <= 90000 && amount > 80000) {
      amount = 90000;
    } else if (amount > 90000) {
      amount = 100000;
    }
    return amount;
  }

  bool check2 = false;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  Future<void> fetch_data() async {
    await ref
        .child("topfive/${widget.data.elementAt(1)}/${mobile_price.toString()}")
        .once()
        .then((DataSnapshot snap) {
      setState(() {
        for (int i = 1; i < snap.value.length; i++) {
          main_data.add(topfive(snap.value[i]['name'], snap.value[i]['price']));
        }
      });
    }).catchError((e) {
      print("error");
    });

    for (int i = 0; i < main_data.length; i++) {
      await ref
          .child("Compare/Mobiles/${main_data[i].name}")
          .once()
          .then((DataSnapshot snap) {
        setState(() {
          print(snap);
          main_d.add(snap);
          try {
            rating1(snap.value["ratings"]["Overall NDTV Rating"]);
          } catch (e) {
            rating1("rating9");
          }
        });
      }).catchError((e) {
        print("error");
      });
    }
    check2 = true;
  }

  void rating1(var a) {
    setState(() {
      switch (a) {
        case "rating1":
          num1.add(1);
          break;
        case "rating2":
          num1.add(2);
          break;
        case "rating3":
          num1.add(3);
          break;
        case "rating4":
          num1.add(4);
          break;
        case "rating5":
          num1.add(5);
          break;
        case "rating6":
          num1.add(6);
          break;
        case "rating7":
          num1.add(7);
          break;
        case "rating8":
          num1.add(8);
          break;

        case "rating9":
          num1.add(9);
          break;

        case "rating10":
          num1.add(10);
          break;
        default:
          num1.add(8);
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: main_data.length == 0
          ? SafeArea(
              child: Container(
              color: Colors.white,
              child: Loading(),
            ))
          : check2
              ? Container(
                  color: Colors.amberAccent,
                  child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        leading: GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        title: Text(
                          "Suggestion",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        iconTheme: new IconThemeData(color: Colors.black87),
                      ),
                      body: Container(
                        margin: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/Compare01',
                                    arguments: [main_d[index].key, "", ""]);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
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
                                            offset: Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 170,
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: Image.network(
                                              main_d[index].value["image"]),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2) -
                                              30,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2) -
                                              30,
                                          height: 170,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                main_d[index].key,
                                                // price_data["10000"][index],
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "Processor: ${main_d[index].value["key specs"]["Processor"]}\nRAM:${main_d[index].value["key specs"]["RAM"]}\nPrice ${main_d[index].value["price"]} ",
                                                softWrap: true,
                                                style: TextStyle(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      icon[index],
                                      size: 30,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 13,
                                    child: CircularPercentIndicator(
                                      progressColor: num1[index] <= 8
                                          ? Colors.orange
                                          : Colors
                                              .green[400], //color of progress
                                      percent: num1[index] / 10, //
                                      animation: true,
                                      radius: 50,
                                      lineWidth: 5, //size of border
                                      circularStrokeCap:
                                          CircularStrokeCap.round,

                                      backgroundColor: num1[index] <= 8
                                          ? Colors.orange[100]
                                          : Colors.green[100],
                                      center: Text(
                                        "${num1[index]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ), //text show mate
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )))
              : SafeArea(
                  child: Container(
                  color: Colors.white,
                  child: Loading(),
                )),
    );
  }
}
