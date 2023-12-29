import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'package:flutter_native_admob/flutter_native_admob.dart';

const _appid = "ca-app-pub-9087629297377127~9869438358";

class News1 extends StatefulWidget {
  @override
  _News1State createState() => _News1State();
}

class _News1State extends State<News1> {
  List<String> data = [];
  var width;
  var height;

  final _nativeAdController = NativeAdmobController();
  bool scrollUp = true;
  final _controller1 = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller1.addListener(() {
      setState(() {
        if (_controller1.position.userScrollDirection ==
            ScrollDirection.forward) {
          scrollUp = true;
        }
        if (_controller1.position.userScrollDirection ==
            ScrollDirection.reverse) {
          scrollUp = true;
        }
      });
    });
  }

  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String heading = data[0];
    String img = data[1];
    String subnews = data[2];

    String content = data[3];
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            color: Colors.white,
            child: ListView(
              controller: _controller1,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width,
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  child: Text(
                    "$heading",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  // margin: EdgeInsets.all(10),
                  child: Image.network("$img"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  child: Text(
                    "$subnews",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  child: Text(
                    "$content",
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 0.2, wordSpacing: 5),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: 170,
                    child: NativeAdmob(
                        // Your ad unit id
                        // options: NativeAdmobOptions(),
                        adUnitID: "ca-app-pub-9087629297377127/8371991023",
                        loading: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text("\n\nAd is loading...")
                            ],
                          ),
                        ),
                        controller: _nativeAdController,
                        type: NativeAdmobType.full,
                        error: Center(
                          child: Text("Failed to Load Ad"),
                        )))
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              height: width / 5,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SafeArea(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          //   width: width / 10,
                          // height: width / 10,
                          //  color: Colors.black,
                          //  margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                        Icons.arrow_back,
                        size: width / 10,
                      )),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                        alignment: Alignment.topRight,
                        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: FloatingActionButton(
                          //mini: true,
                          backgroundColor: Colors.deepOrange[300],
                          onPressed: () async {
                            Share.share("$heading", subject: "$subnews");
                          },
                          child: Icon(Icons.share),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
