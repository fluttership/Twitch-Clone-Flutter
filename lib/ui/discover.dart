import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 15.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 15.0),
          child: Text(
            'Discover',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schelter'),
          ),
        ),
        SizedBox(height: 10.0)
      ],
    );
  }
}
