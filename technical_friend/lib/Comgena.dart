import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';

class Comgena extends StatefulWidget {
  var data, count, id;
  Comgena(var name, var count, var id) {
    this.data = name;
    this.count = count;
    this.id = id;
  }
  @override
  _ComgenaState createState() => _ComgenaState();
}

class _ComgenaState extends State<Comgena> {
  var _con = ScrollController();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data1, count1, data_snap = [], check = false;
  var width, height;
  var id;
  var keyspecs = [
    'Display',
    'Processor',
    'Front Camera',
    'Rear Camera',
    'RAM',
    'Storage',
    'Battery Capacity',
    'OS',
  ];
  var route_data = Map();
  bool check2 = false;
  void initState() {
    super.initState();
    _con.addListener(() {
      print(_con);
    });

    data1 = widget.data;

    count1 = widget.count;
    setState(() {
      fetch1();

      route_data["key specs"] = keyspecs;
      check2 = true;
    });
  }

  bool check10 = false;
  Future<void> fetch1() {
    for (int i = 0; i < count1; i++) {
      data1[i] = data1[i].toString().replaceAll("slash", "/");
      data1[i] = data1[i].toString().replaceAll("point1", ".");

      // i++;
      ref
          .child('Compare/Mobiles/${data1[i]}/${widget.id}')
          .once()
          .then((DataSnapshot snap) {
        setState(() {
          data_snap.add(snap);
        });

        // print(data_snap[i].value("Camera Rating"));
        // }
      }).catchError((e) {
        final snackBar = SnackBar(content: Text("Check Your Network"));
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
    setState(() {
      check = true;
    });
    check10 = true;
  }

  Widget make(var name) {
    // width = MediaQuery.of(context).size.width;
    return Container(
        width: width / 3,
        height: width / 5,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: width / 5,
          height: width / 6,
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

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if (data_snap.length == count1) {
      return Container(

          // color: Colors.black,
          margin: EdgeInsets.all(10),
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              //scrollDirection: Axis.vertical,

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      make("Mobile\n name"),
                      make(route_data[widget.id][0]),
                      make(route_data[widget.id][1]),
                      make(route_data[widget.id][2]),
                      make(route_data[widget.id][3]),
                      make(route_data[widget.id][4]),
                      make(route_data[widget.id][5]),
                      make(route_data[widget.id][6]),
                      make(route_data[widget.id][7])
                    ],
                  ),
                ),
                widget.data[0] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[0]),
                              ),
                            ),
                            make(data_snap[0].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][2]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][3]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][4]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][5]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][6]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][7]] ??
                                " "),
                          ],
                        ),
                      ),
                widget.data[1] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[1]),
                              ),
                            ),
                            make(data_snap[1].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][2]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][3]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][4]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][5]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][6]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][7]] ??
                                " "),
                          ],
                        ),
                      ),
                widget.data[2] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[2]),
                              ),
                            ),
                            make(data_snap[2].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][2]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][3]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][4]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][5]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][6]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][7]] ??
                                " "),
                          ],
                        ),
                      ),
              ],
            ),
          ]));
    } else {
      return Container(
        child: Loading(),
      );
    }
  }
}

class Comgena2 extends StatefulWidget {
  var data, count, id;
  Comgena2(var name, var count, var id) {
    this.data = name;
    this.count = count;
    this.id = id;
  }

  @override
  _Comgena2State createState() => _Comgena2State();
}

class _Comgena2State extends State<Comgena2> {
  var _con = ScrollController();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data1, count1, data_snap = [], check = false;
  var width, height;
  var id;
  var keyspecs = [
    'Display',
    'Processor',
    'Front Camera',
    'Rear Camera',
    'RAM',
    'Storage',
    'Battery Capacity',
    'OS',
  ];
  var general = [
    'Brand',
    'Model',
    'Dimensions (mm)',
    'Weight (g)',
    'Battery capacity (mAh)',
    'Fast charging',
    'Colours',
    'Wireless charging',
    'Body type',
  ];
  var display = [
    'Screen size (inches)',
    'Touchscreen',
    'Resolution',
    'Aspect ratio',
  ];
  var hardware = [
    'Processor',
    'Processor make',
    'RAM',
    'Internal storage',
    'Expandable storage',
  ];
  var camera = ['Rear camera', 'Rear autofocus', 'Front camera'];
  var software = ['Operating system'];
  var sim = ['SIM Type', '3G', '4G-LTE'];
  var sensors = [
    'Face unlock',
    'Fingerprint sensor',
    'Compass-Magnetometer',
  ];
  var connectivity = [
    'Wi-Fi',
    'GPS',
    'Bluetooth',
    'USB Type-C',
    'Number of SIMs'
  ];

  var route_data = Map();
  bool check2 = false;
  void initState() {
    super.initState();
    _con.addListener(() {
      print(_con);
    });

    data1 = widget.data;

    count1 = widget.count;
    setState(() {
      fetch1();

      route_data["key specs"] = keyspecs;
      route_data["general"] = general;
      route_data["display"] = display;
      route_data["hardware"] = hardware;
      route_data["camera"] = camera;
      route_data["software"] = software;
      route_data["sim 1"] = sim;
      route_data["sim 2"] = sim;
      route_data["sensors"] = sensors;
      route_data["connectivity"] = connectivity;
      check2 = true;
    });
  }

  bool check10 = false;
  Future<void> fetch1() {
    for (int i = 0; i < count1; i++) {
      data1[i] = data1[i].toString().replaceAll("slash", "/");
      data1[i] = data1[i].toString().replaceAll("point1", ".");

      // i++;
      ref
          .child('Compare/Mobiles/${data1[i]}/${widget.id}')
          .once()
          .then((DataSnapshot snap) {
        setState(() {
          data_snap.add(snap);
        });

        // print(data_snap[i].value("Camera Rating"));
        // }
      }).catchError((e) {
        final snackBar = SnackBar(content: Text("Check Your Network"));
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
    setState(() {
      check = true;
    });
    check10 = true;
  }

  Widget make(var name) {
    // width = MediaQuery.of(context).size.width;
    return Container(
        width: width / 3,
        height: width / 5,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: width / 5,
          height: width / 6,
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

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if (data_snap.length == count1) {
      return Container(

          // color: Colors.black,
          margin: EdgeInsets.all(10),
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              //scrollDirection: Axis.vertical,

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      make("Mobile\n name"),
                      make(route_data[widget.id][0]),
                      make(route_data[widget.id][1]),
                      make(route_data[widget.id][2]),
                      //make(route_data[widget.id][3]),
                    ],
                  ),
                ),
                widget.data[0] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[0]),
                              ),
                            ),
                            make(data_snap[0].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[0].value[route_data[widget.id][2]] ??
                                " "),
                            //make(data_snap[0].value[route_data[widget.id][3]]),
                          ],
                        ),
                      ),
                widget.data[1] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[1]),
                              ),
                            ),
                            make(data_snap[1].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[1].value[route_data[widget.id][2]] ??
                                " "),
                            // make(data_snap[1].value[route_data[widget.id][3]]),
                          ],
                        ),
                      ),
                widget.data[2] == ""
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              width: width / 3,
                              height: width / 5,
                              child: Center(
                                child: Text(widget.data[2]),
                              ),
                            ),
                            make(data_snap[2].value[route_data[widget.id][0]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][1]] ??
                                " "),
                            make(data_snap[2].value[route_data[widget.id][2]] ??
                                " "),
                            // make(data_snap[2].value[route_data[widget.id][3]]),
                          ],
                        ),
                      ),
              ],
            ),
          ]));
    } else {
      return Container(
        child: Loading(),
      );
    }
  }
}
