import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/live.dart';

class LiveTileSmall extends StatefulWidget {
  final LiveModel model;

  LiveTileSmall({Key key, @required this.model}) : super(key: key);

  @override
  _FollowingTileState createState() => _FollowingTileState();
}

class _FollowingTileState extends State<LiveTileSmall> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K';
  }

  Widget _userPicture() {
    return Container(
      height: 20.0,
      width: 20.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: widget.model.userPicture,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _liveImage() {
    return Container(
      width: 120.0,
      height: 70.0,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.model.cover,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 3.0,
            left: 3.0,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.red,
                    width: 10.0,
                    height: 10.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  _showViews(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _liveHeader() {
    return Row(
      children: <Widget>[
        _userPicture(),
        SizedBox(
          width: 5.0,
        ),
        Text(
          widget.model.user,
          style: TextStyle(fontFamily: 'Eina', fontSize: 16.0),
        )
      ],
    );
  }

  Widget _liveMiddle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.model.description,
          style: TextStyle(fontSize: 16.0, fontFamily: 'Biotif Book'),
        ),
        Text(
          widget.model.game,
          style: TextStyle(
              fontSize: 13.0, color: Colors.grey[700], fontFamily: 'Shapiro'),
        )
      ],
    );
  }

  Widget _liveBottom() {
    return Container(
      height: 20.0,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.model.tags.length,
        itemBuilder: (BuildContext context, int index) {
          return TextTag(text: widget.model.tags[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Quantidade: ${widget.model.tags.length}');
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 15.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _liveImage(),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _liveHeader(),
                  SizedBox(height: 5.0),
                  _liveMiddle(),
                  SizedBox(height: 5.0),
                  _liveBottom()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
