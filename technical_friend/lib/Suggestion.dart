import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_friend/Compare0.dart';
import 'package:technical_friend/Info.dart';
import 'package:technical_friend/Suggest.dart';

class Suggestion extends StatefulWidget {
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            //     title: Title(color: Colors.white, child: Text(" 123")),
            backgroundColor: Colors.white,
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.orange,

              // labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: <Widget>[
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.phone_android), Text("Mobile")],
                  ),
                  //  text: Text("Mobile"),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.tablet_mac), Text("Tablet")],
                  ),

                  //text: Text("Mobile"),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.tv), Text("TV")],
                  ),
                  //text: Text("Mobile"),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.laptop), Text("Laptop")],
                  ),
                  //text: Text("Mobile"),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Suggest("Mobile"),
            Container(
                child: Center(
              child: Text(
                  "Sorry, This page is not working due to some issue of database."),
            )),
            Container(
                child: Center(
              child: Text(
                  "Sorry, This page is not working due to some issue of database"),
            )),
            Container(
                child: Center(
              child: Text(
                  "Sorry, This page is not working due to some issue of database"),
            )),
          ],
        ),
      ),
    );
  }
}
