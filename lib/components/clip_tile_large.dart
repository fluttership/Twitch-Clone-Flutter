import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/model/clips.dart';
import 'package:twitch_clone/utils/constants.dart';
import 'package:twitch_clone/utils/custom_icons.dart';

class ClipTileLarge extends StatefulWidget {
  final ClipsModel model;
  final String categorie;

  ClipTileLarge({Key key, this.model, this.categorie}) : super(key: key);

  @override
  _ClipTileLargeState createState() => _ClipTileLargeState();
}

class _ClipTileLargeState extends State<ClipTileLarge> {
  String _showViews() {
    return widget.model.views < 1000
        ? '${widget.model.views} views'
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K views';
  }

  Widget _topInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[_userImageLive(), _infoLive()],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(CustomIcons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(CustomIcons.more_vert),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _middleInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[_imageCover(), _views(), _duration()],
        ),
      ),
    );
  }

  Widget _bottomInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 15.0),
          child: Text(widget.model.description, style: TextStyle(fontFamily: 'Eina', fontSize: 16.0),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width  / 2.1,
              child: _actionButton('Watch full video', () {}),
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              width: MediaQuery.of(context).size.width  / 2.1,
              child: _actionButton('Share', () {})
            ),
            SizedBox(height: 80.0)
          ],
        )
      ],
    );
  }

  Widget _userImageLive() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: FadeInImage.memoryNetwork(
            image: widget.model.userImage,
            placeholder: kTransparentImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _infoLive() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model.user,
              style: TextStyle(fontFamily: 'Eina', fontSize: 16.0)),
          Text(widget.model.date,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                  fontFamily: 'Shapiro')),
          Text(widget.model.categorie,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                  fontFamily: 'Shapiro'))
        ],
      ),
    );
  }

  Widget _imageCover() {
    return FadeInImage.memoryNetwork(
      image: widget.model.cover,
      placeholder: kTransparentImage,
      fit: BoxFit.cover,
    );
  }

  Widget _views() {
    return Positioned(
      bottom: 6.0,
      left: 15.0,
      child: Text(
        _showViews(),
        style: TextStyle(fontFamily: 'Eina'),
      ),
    );
  }

  Widget _duration() {
    return Positioned(
      bottom: 6.0,
      right: 15.0,
      child: Text(
        widget.model.duration,
        style: TextStyle(fontFamily: 'Eina'),
      ),
    );
  }

  Widget _actionButton(String text, Function function) {
    return MaterialButton(
      onPressed: function,
      color: Constants.isDark ? Colors.grey[600] : Colors.grey[300],
      child: Text(text, style: TextStyle(fontFamily: 'Eina')),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_topInfo(), _middleInfo(), _bottomInfo()],
    );
  }
}
