import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_friend/ComRating.dart';
import 'package:technical_friend/Comgena.dart';
import 'package:technical_friend/Connectivity.dart';
import 'package:technical_friend/Hardware.dart';
import 'package:technical_friend/Loading.dart';
import 'package:technical_friend/Offer.dart';
import 'package:technical_friend/Point.dart';
import 'package:technical_friend/sim.dart';
import './Compare02.dart';
import './Camera.dart';
import './General.dart';
import 'dart:async';

class Compare01 extends StatefulWidget {
  _Compare01State createState() => _Compare01State();
}

class _Compare01State extends State<Compare01> {
  var data;

  var main_data = [];
  var main_key = [];
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Look'),
    Tab(text: 'Ratings'),
    Tab(text: 'Key Specs'),
    Tab(text: 'ADV/DA'),

    // Tab(text: 'General'),
    Tab(text: 'Display'),
    Tab(text: 'Hardware'),
    Tab(text: 'Camera'),
    // Tab(text: 'Sim 1'),
    // Tab(text: 'Sim 2'),
    Tab(text: 'Sensors'),
    Tab(text: 'Connectivity'),
    Tab(text: 'Offers'),
  ];
  int check = 0;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    for (int i = 0; i < 3; i++) {
      if (data[i] != "") {
        check = check + 1;
      }
    }

    return Scaffold(
        body: DefaultTabController(
      length: myTabs.length,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[600],
                    size: 30,
                  ),
                ),
                title: Text(
                  "Comparision",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                floating: true,
                pinned: true,
                snap: true,
                backgroundColor: Colors.white,
                bottom: new TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.orange,
                  tabs: <Tab>[
                    myTabs[0],
                    myTabs[1],
                    myTabs[2],
                    myTabs[3],
                    myTabs[4],
                    myTabs[5],
                    myTabs[6],
                    myTabs[7],
                    myTabs[8],
                    myTabs[9],
                    // myTabs[10],
                    // myTabs[11],
                  ], // <-- total of 2 tabs
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              Compare02(data, check),
              ComRating(data, check),
              Comgena(data, check, "key specs"),
              Point(data, check),
              // Text("Sorry, No data"),
              // General(data, check, "general"),
              Comgena2(data, check, "display"),
              Hard(data, check, "hardware"),
              Camera(data, check, "camera"),

              // Sim(data, check, "sim 1"),
              // Sim(data, check, "sim 2"),

              Comgena2(data, check, "sensors"),

              Connect(data, check, "connectivity"),

              // Comgena3(data, check, "hardware"),
              // Comgena4(data, check, "camera"),
              // Comgena5(data, check, "software"),
              // Comgena6(data, check, "sim 1"),
              // Comgena6(data, check, "sim 2"),
              // Comgena7(data, check, "sensors"),
              // Comgena8(data, check, "connectivity"),
              Offer(),
            ],
          ),
        ),
      ),
    ));
  }
}
