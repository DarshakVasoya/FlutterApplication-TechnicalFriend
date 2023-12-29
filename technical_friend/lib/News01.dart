import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';
import 'package:technical_friend/myData.dart';
import 'package:share/share.dart';
import 'package:firebase_database/firebase_database.dart';
import './Loading.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:connectivity/connectivity.dart';

const _appid = "ca-app-pub-9087629297377127~9869438358";

class News01 extends StatefulWidget {
  static const MobileAdTargetingInfo targetingInfo =
      MobileAdTargetingInfo(keywords: ["Mobile", "Technology"]);
  @override
  String name;
  News01(String name1) {
    this.name = name1;
  }
  _News01State createState() => _News01State();
}

class _News01State extends State<News01> {
  InterstitialAd _interstitialAd;

  InterstitialAd createinterstitialad() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-9087629297377127/7096043152",
      targetingInfo: MobileAdTargetingInfo(keywords: [
        "Mobile",
        "Technology",
        "India",
        "Ecommerce",
        "Hindi",
        "Gujrati",
        "Movie"
      ]),
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          _interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          _interstitialAd = createinterstitialad()..load();
        }
      },
    );
  }

  double height_Ad = 170;
  var result;
  List<myData> all = [];
  final _controller = ScrollController();
  List like0 = [];
  var floatbutton = Container();
  var height1;
  final _nativeAdController = NativeAdmobController();

  bool first_time = false;
  bool wait_data = false;
  DateTime now = DateTime.now();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  int down = 0;
  int count = 0;
  String name;
  void dispose() {
    _interstitialAd?.dispose();

    // super.dispose();
    super.dispose();
  }

  void initState() {
    //int length = 0;

    super.initState();
    FirebaseAdMob.instance.initialize(appId: _appid);
    _interstitialAd = createinterstitialad()..load();
    name = (widget.name);
    height1 = 200;
    // widget.name;
    _controller.addListener(() {
      //  _controller.animateTo(2, duration: Duration(microseconds: 1), curve: Curves.ease);

      // if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      //   down++;

      //   count = down;
      //   first_time = false;
      //   wait_data = true;
      //   fetch1();
      // }
      setState(() {
        if (_controller.position.pixels > height1) {
          floatbutton = Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                _controller.animateTo(2,
                    duration: Duration(microseconds: 5000), curve: Curves.ease);
              },
              child: Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
              ),
            ),
          );
        } else {
          floatbutton = Container();
        }
      });
    });
    count = 0;
    first_time = false;
    fetch1();
  }

  bool daya = true;
  Future<void> fetch1() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      setState(() {
        // while (all.length <= 0) {
        if (first_time) {
          //  wait_data = false;

          final snackBar = SnackBar(content: Text("No more news"));

          Scaffold.of(context).showSnackBar(snackBar);
        } else {
          first_time = true;
          DateTime yesterday = now.subtract(Duration(days: 0));
          // String time0 = count.toString();
          // int day = yesterday.day;
          // int month = yesterday.month;
          // int year = yesterday.year;

          var yesday = yesterday.toIso8601String().split("T")[0];

          ref.child('News/${yesday}').once().then((DataSnapshot snap) {
            var keys = snap.value.keys;
            var data = snap.value;

            for (var k in keys) {
              all.add(myData(
                  data[k]['heading'].toString(),
                  data[k]['subnews'].toString(),
                  data[k]['image'].toString(),
                  data[k]['content'].toString()));
            }
            setState(() {
              daya = false;
            });
            // all.add(myData(data[keys[0]]['heading'], data[keys[0]]['subnews'],
            //   data[keys[0]]['image'], data[keys[0]]['content']));

            // //for (var key in keys) {
            // like0.add("false");
            // all.add(myData(data[keys[0]]['heading'], data[keys[0]]['subnews'],
            //     data[keys[0]]['image'], data[keys[0]]['content']));
            // //}
            // setState(() {
            //   if (all.length != 0) {
            //     daya = false;
            //   }
            // });
            // /*    wait_data = false;
            // if (all.length < 5) {
            //   down++;
            //   count = down;
            //   first_time = false;

            //   fetch1();
            // }*/
          }).catchError((e) {
            wait_data = false;
            final snackBar = SnackBar(content: Text("No more news"));
            down--;
            Scaffold.of(context).showSnackBar(snackBar);
          });
          //  }
          count = 0;
        }
      });
    } else {
      final snackBar = SnackBar(content: Text("Check Your Network Connection"));

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.width - 20) / 2.2;
    final width = MediaQuery.of(context).size.width - 20;
    //  final subnewsLength = (((width - 12) * (3 / 4)) / 7).ceil() * 2;
    return Scaffold(
        body: daya
            ? Loading()
            : RefreshIndicator(
                child: Stack(
                  children: [
                    Container(
                      child: ListView.separated(
                          controller: _controller,
                          itemCount: all.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return index % 3 == 2
                                ? Container(
                                    height: height_Ad,
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
                                    //constraints: BoxConstraints.tightFor(height:150),

                                    //   height: height,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    child: NativeAdmob(
                                        // Your ad unit id
                                        options: NativeAdmobOptions(),
                                        adUnitID:
                                            "ca-app-pub-9087629297377127/8371991023",
                                        loading: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(),
                                              Text("\n\nAd is loading...")
                                            ],
                                          ),
                                        ),
                                        controller: _nativeAdController,
                                        type: NativeAdmobType.full,
                                        error: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                height_Ad = 0;
                                              });
                                            },
                                          ),
                                        )))
                                : Container();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            //  String logoImage = all[index].logo;
                            String newsImage = all[index].image;
                            String heading = all[index].heading;
                            String subNews = all[index].subnews;
                            String content = all[index].content;
                            newsImage = newsImage.replaceAll("[", "");
                            newsImage = newsImage.replaceAll("]", "");
                            var im = newsImage.split(",");
                            newsImage = im[0];

                            // String newsName = all[index].news_name;

                            return Container(
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

                                //   height: height,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () async {
                                        try {
                                          await _interstitialAd?.show();
                                        } catch (e) {}
                                        Navigator.pushNamed(context, '/News1',
                                            arguments: [
                                              heading,
                                              newsImage,
                                              subNews,
                                              content
                                            ]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        //textBaseline: TextBaseline.ideographic,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            width: (width - 12) * (3 / 4),
                                            //   height: height / 1.3,
                                            //  color: Colors.black,

                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  "$heading",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                ),
                                                Text(
                                                  "$subNews" + "...",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ),

                                          Container(
                                            width: (width - 12) * (1 / 4) - 10,
                                            //   height: height / 2,

                                            //   color: Colors.blue,
                                            //alignment: Alignment.bottomLeft,
                                            decoration: BoxDecoration(
                                                //    border: Border.all(color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                "$newsImage",
                                                fit: BoxFit.contain,
                                                width:
                                                    (width - 12) * (1 / 4) - 2,
                                                height: height / 2,
                                              ),
                                            ),
                                          ),

                                          //                        Text('Hi, my nami ssfdfkj dsjlsdj dkvlsdjf lkdsj',style: TextStyle(fontWeight: FontWeight.bold),softWrap: true),

                                          //                     Image.network(list[index],width: width-2, height:height-2),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height / 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        /*  GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (like0[index] == "false") {
                                                  like0[index] = "true";
                                                } else {
                                                  like0[index] = "false";
                                                }
                                              });
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  like0[index] == "false"
                                                      ? Icons.save_alt
                                                      : Icons.save_alt,
                                                  color: like0[index] == "false"
                                                      ? Colors.grey[600]
                                                      : Colors.red,
                                                ),
                                                like0[index] == "false"
                                                    ? Text(" save")
                                                    : Text(" saved"),
                                              ],
                                            )),*/
                                        GestureDetector(
                                          onTap: () async {
                                            Share.share(
                                                "$heading" + "\n $subNews");
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.share,
                                                  size: 20,
                                                  color: Colors.grey[600]),
                                              Text("  share"),
                                            ],
                                          ),
                                        ),
                                        //     time == "0"
                                        //       ? Text("Few hours ago ")
                                        //:
                                        Text("1 day ago"),
                                      ],
                                    ),
                                  ],
                                ));
                          }),
                    ),
                    floatbutton,
                  ],
                ),
                onRefresh: fetch1,
              ));
  }
}
