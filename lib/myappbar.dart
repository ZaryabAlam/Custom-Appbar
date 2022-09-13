import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
        PreferredSize(
           preferredSize: Size.fromHeight(10.0),
          child: AppBar(         
            backgroundColor: Colors.blue,
            elevation: 0,
          ),
        ),

      body: Column(
        children: [
          ClipPath(
  clipper: WaveClip(),
  child: Container(
    height: 80,
    padding: EdgeInsets.only(bottom: 30),
    alignment: Alignment(0, -.5),
    color: Colors.blue,
    child: Text("To Do 02",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
  ),
),
        ],
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = size.height / 2;
    var p = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(0, curveHeight, curveHeight, curveHeight)
      ..lineTo(size.width - curveHeight, curveHeight)
      ..quadraticBezierTo(size.width, curveHeight, size.width, size.height)
      ..lineTo(size.width, 0);

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}