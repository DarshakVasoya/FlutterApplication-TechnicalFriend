import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';

class Compare02 extends StatefulWidget {
  var data, count;
  Compare02(var data, var count) {
    this.data = data;
    this.count = count;
  }
  @override
  _Compare02State createState() => _Compare02State();
}

class _Compare02State extends State<Compare02> {
  var data1;
  bool check = false;
  var count1;
  int kd = 0;
  var i = 0;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var im = "";
  var images = [];
  var prices = [];
  void initState() {
    super.initState();
    data1 = widget.data;

    count1 = widget.count;
    setState(() {
      fetch1();
    });
  }

  Widget make(int i) {
    try {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 30,
              child: Center(
                child: Text(
                  data1[i],
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 400,
              child: Image.network(
                images[i],
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text("Price::   " + prices[i]),
            )
          ],
        ),
      );
    } catch (e) {
      return Container(
        child: Center(child: Text("Check Your Network Connection")),
      );
    }
  }

  Future<void> fetch1() {
    for (int i = 0; i < count1; i++) {
      data1[i] = data1[i].toString().replaceAll("slash", "/");
      data1[i] = data1[i].toString().replaceAll("point1", ".");

      // i++;
      ref.child('Compare/Mobiles/${data1[i]}').once().then((DataSnapshot snap) {
        images.add(snap.value["image"]);
        prices.add(snap.value["price"]);

        setState(() {
          var temp = images[i].toString();
          temp = temp.replaceAll("slash", "/");
          temp = temp.replaceAll("point1", ".");
          images[i] = (temp);

          check = true;
        });
        // print(im);
        // }
      }).catchError((e) {
        final snackBar = SnackBar(content: Text("Data is not found.."));
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (prices.length != count1) {
      return Container(
        child: Center(child: Loading()),
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              data1[0] == ""
                  ? Container(child: Center(child: Text("")))
                  : images[0] == "No"
                      ? Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                              child: Text("Sorry,No image (${data1[0]})")))
                      : make(0),
              data1[1] == ""
                  ? Container(child: Center(child: Text("")))
                  : images[1] == "No"
                      ? Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                              child: Text("Sorry,No image(${data1[1]})")))
                      : make(1),
              data1[2] == ""
                  ? Container(child: Center(child: Text("")))
                  : images[2] == "No"
                      ? Container(
                          margin: EdgeInsets.all(15),
                          child: Center(
                              child: Text("Sorry,No image(${data1[2]})")))
                      : make(2),
            ],
          ),
        ),
      );
    }
  }
}
