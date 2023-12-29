import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:technical_friend/Compare02.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technical_friend/Loading.dart';
import 'package:technical_friend/Suggestion.dart';
import 'package:connectivity/connectivity.dart';
// import 'package:fi'

import 'package:firebase_admob/firebase_admob.dart';

// import 'package:admob_flutter/admob_flutter.dart';
// const String testDevice = 'YOUR_DEVICE_ID';
const _appid = "ca-app-pub-9087629297377127~9869438358";

class Info extends StatefulWidget {
  String name;
  Info(String name) {
    this.name = name;
  }
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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

  DatabaseReference ref = FirebaseDatabase.instance.reference();

  AutoCompleteTextField textField;
  List suggestedList = [];
  var data;
  bool check = false;
  var firstsuggestedControler = TextEditingController();
  var secondsuggestedControler = TextEditingController();
  var thirdsuggestedControler = TextEditingController();
  var fouth = TextEditingController();
  @override
  GlobalKey key3 = new GlobalKey<AutoCompleteTextFieldState<String>>();
  GlobalKey key1 = new GlobalKey<AutoCompleteTextFieldState<String>>();
  GlobalKey key2 = new GlobalKey<AutoCompleteTextFieldState<String>>();
  GlobalKey key4 = new GlobalKey<AutoCompleteTextFieldState<String>>();
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: _appid);
    _interstitialAd = createinterstitialad()..load();

    fetch1();
  }

  void dispose() {
    _interstitialAd?.dispose();
    // super.dispose();
    super.dispose();
  }

  Future<void> fetch1() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      // I am connected to a mobile network.
      setState(() {
        // while (all.length <= 0) {
        ref.child('Compare/${widget.name}').once().then((DataSnapshot snap) {
          var keys = snap.value.keys;
          data = snap.value;

          for (var key in keys) {
            //  like0.add("false");
            suggestedList.add(key);
          }
        }).catchError((e) {
          final snackBar = SnackBar(content: Text("Database is updating"));
          Scaffold.of(context).showSnackBar(snackBar);
        });
        check = true;
        //  }
      });
    } else {
      final snackBar = SnackBar(content: Text("Check Your Network Connection"));

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return check
        ? SingleChildScrollView(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                AutoCompleteTextField(
                    suggestionsAmount: 5,
                    key: key1,
                    controller: firstsuggestedControler,
                    clearOnSubmit: false,
                    itemSubmitted: (item) {
                      setState(() {
                        firstsuggestedControler.text = item;
                      });
                    },
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      //  icon: Icon(Icons.add),

                      hintText: "Enter ${widget.name} Name",
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    suggestions: suggestedList,
                    itemBuilder: (context, suggestion) => Container(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          leading: Text(suggestion),
                          trailing: Text("Rs. " + data[suggestion]),
                        )),
                    itemSorter: (a, b) {
                      return a.compareTo(b);
                    },
                    itemFilter: (item, query) {
                      return item.toLowerCase().startsWith(query.toLowerCase());
                    }),
                Container(
                  margin: EdgeInsets.fromLTRB(0, width / 2, 0, 0),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () async {
                      // _bannerAd ??= createBannerAd();
                      await _interstitialAd?.show();
                      Navigator.pushNamed(context, '/Compare01', arguments: [
                        firstsuggestedControler.text,
                        secondsuggestedControler.text,
                        thirdsuggestedControler.text
                      ]);
                      // Respond to button press
                    },
                    // icon: Icon(Icons.add, size: 18),
                    child: Text("Get Information"),
                  ),
                ),
              ],
            ),
          ))
        : Loading();
  }
}
