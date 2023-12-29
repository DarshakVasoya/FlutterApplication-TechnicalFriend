import 'package:flutter/material.dart';
import 'dart:math';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  bool disposed = false;
  AnimationController acontroller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initial_radius = 30;
  double radius = 0;
  final double dot_radius = 7;
  @override
  void initState() {
    super.initState();
    acontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: acontroller,
            curve: Interval(0, 1.0, curve: Curves.linear)));
    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: acontroller,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: acontroller,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    acontroller.addListener(() {
      if (!disposed) {
        setState(() {
          if (acontroller.value >= 0.0 && acontroller.value <= 0.25) {
            radius = animation_radius_out.value * initial_radius;
          } else if (acontroller.value >= 0.75 && acontroller.value <= 1.0) {
            radius = animation_radius_in.value * initial_radius;
          }
        });
      }
    });

    acontroller.repeat();
  }

  void dispose() {
    disposed = false;
    acontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RotationTransition(
      turns: animation_rotation,
      child: Container(
          width: 200,
          height: 200,
          child: Center(
            child: Stack(
              children: <Widget>[
                Create(
                  radius: 20,
                  color: Colors.black12,
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi), radius * sin(pi)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.redAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.greenAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi / 2), radius * sin(pi / 2)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.amberAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.blueAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi), radius * sin(pi)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.cyanAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.pinkAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.orangeAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(2 * pi), radius * sin(2 * pi)),
                  child: Create(
                    radius: dot_radius,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}

class Create extends StatelessWidget {
  final double radius;
  final Color color;
  Create({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
