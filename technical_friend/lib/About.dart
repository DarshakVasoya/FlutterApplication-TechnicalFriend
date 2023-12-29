import 'package:flutter/material.dart';

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("About Us"),
      ),
      body: Container(
          // color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(text: "Dear Friend,", style: TextStyle(fontSize: 30)),
            TextSpan(
                text:
                    "\n\n\nThis app is very useful for updating your technical knowledge, compareing Mobiles, get information about any mobile and sugesting best mobile according to your requirements.",
                style: TextStyle(fontSize: 15)),
            TextSpan(
                text:
                    "\n \n \nDeveloper contacts: Email:darshakvasoya1310@gmail.com",
                style: TextStyle(fontSize: 20)),
          ]))),
    );
  }
}
