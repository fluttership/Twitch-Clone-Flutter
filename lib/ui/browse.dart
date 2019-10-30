import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 15.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 15.0),
          child: Text(
            'Browse',
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
