import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';

class Hard extends StatefulWidget {
  var data, count, id;
  Hard(var name, var count, var id) {
    this.data = name;
    this.count = count;
    this.id = id;
  }

  @override
  _HardState createState() => _HardState();
}

class _HardState extends State<Hard> {
  @override
  var _con = ScrollController();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data1, count1, data_snap = [], check = false;
  var width, height;
  var id;
  var hardware = [
    'Processor',
    'Processor make',
    'RAM',
    'Internal storage',
    'Expandable storage',
  ];
  var route_data = Map();
  bool check2 = false;
  void initState() {
    super.initState();

    data1 = widget.data;

    count1 = widget.count;
    setState(() {
      fetch1();
      check2 = true;
    });
  }

  bool check10 = false;
  Future<void> fetch1() async {
    for (int i = 0; i < count1; i++) {
      data1[i] = data1[i].toString().replaceAll("slash", "/");
      data1[i] = data1[i].toString().replaceAll("point1", ".");

      // i++;
      await ref
          .child('Compare/Mobiles/${data1[i]}/hardware')
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

    if ((check) && (check2)) {
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
                      // Container(
                      //   // height: 20,
                      //   width: width / 3,
                      //   height: width / 5,
                      //   child: Center(child: Text("Mobile\nnamme")),
                      // ),
                      make("Mobile\nName"),
                      make(hardware[0]),
                      make(hardware[1]),
                      make(hardware[2]),
                      make(hardware[3]),
                      make(hardware[4]),
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
                            make(data_snap[0].value[hardware[0]] ?? " "),
                            make(data_snap[0].value[hardware[1]] ?? " "),
                            make(data_snap[0].value[hardware[2]] ?? " "),
                            make(data_snap[0].value[hardware[3]] ?? " "),
                            make(data_snap[0].value[hardware[4]] ?? " ")
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
                            make(data_snap[1].value[hardware[0]] ?? " "),
                            make(data_snap[1].value[hardware[1]] ?? " "),
                            make(data_snap[1].value[hardware[2]] ?? " "),
                            make(data_snap[1].value[hardware[3]] ?? " "),
                            make(data_snap[1].value[hardware[4]] ?? " ")
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
                            make(data_snap[2].value[hardware[0]] ?? " "),
                            make(data_snap[2].value[hardware[1]] ?? " "),
                            make(data_snap[2].value[hardware[2]] ?? " "),
                            make(data_snap[2].value[hardware[3]] ?? " "),
                            make(data_snap[2].value[hardware[4]] ?? " ")
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
