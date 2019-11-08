import 'package:flutter/material.dart';
import 'package:twitch_clone/utils/constants.dart';

class TextTag extends StatefulWidget {
  final String text;

  TextTag({Key key, this.text}) : super(key: key);

  @override
  _TextTagState createState() => _TextTagState();
}

class _TextTagState extends State<TextTag> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Container(
          color: Constants.isDark ? Colors.grey[800] : Colors.grey[300],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(widget.text,
                  style: TextStyle(fontSize: 12.0, fontFamily: 'Biotif Book')),
            ),
          ),
        ),
      ),
    );
  }
}
