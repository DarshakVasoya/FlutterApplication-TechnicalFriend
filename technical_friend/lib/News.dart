import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_friend/News01.dart';

class News extends StatefulWidget {
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'For You'),
    Tab(text: 'Smart Phone'),
    Tab(text: 'Start Up'),
    Tab(text: 'AI/ML/AR'),
    Tab(text: 'Computer/Laptop'),
    Tab(text: 'International'),
    Tab(text: 'Do You Know?'),
  ];
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.orange,

              // labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: <Widget>[
                myTabs[0],
                myTabs[1],
                myTabs[2],
                myTabs[3],
                myTabs[4],
                myTabs[5],
                myTabs[6],
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            /* News01(),
            News01(),
            News01(),
            News01(),
            News01(),
            News01(),
            News01(),*/

            News01("For You"),
            News01("Smart Phone"),
            News01("Start Up"),
            News01("AI/ML/AR"),
            News01("Computer/Laptop"),
            News01("International"),
            News01("Do You Know?"),
          ],
        ),
      ),
    );
  }
}
