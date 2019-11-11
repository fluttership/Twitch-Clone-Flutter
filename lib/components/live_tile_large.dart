import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/live.dart';

class LiveTileLarge extends StatefulWidget {
  final LiveModel model;

  LiveTileLarge({Key key, @required this.model}) : super(key: key);

  @override
  _LiveTileLargeState createState() => _LiveTileLargeState();
}

class _LiveTileLargeState extends State<LiveTileLarge> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K Viewers';
  }

  Widget _headerLive() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[_imageLive(), _badgeLive(), _badgeViewers()],
    );
  }

  Widget _bottomLive() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _userImageLive(), _infoLive()
      ],
    );
  }

  Widget _imageLive() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage.memoryNetwork(
        image: widget.model.cover,
        placeholder: kTransparentImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _badgeLive() {
    return Positioned(
      top: 6.0,
      left: 6.0,
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Center(
            child: Text(
              'LIVE',
              style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _badgeViewers() {
    return Positioned(
      bottom: 6.0,
      left: 6.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.7,
                0.7
              ],
                  colors: [
                Color.fromARGB(100, 0, 0, 0),
                Color.fromARGB(100, 0, 0, 0)
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
            child: Center(
              child: Text(
                _showViews(),
                style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
              ),
            ),
          ),
        ),
      ),
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
            image: widget.model.userPicture,
            placeholder: kTransparentImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _tagsLive() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
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
      ),
    );
  }

  Widget _infoLive() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model.user, style: TextStyle(fontFamily: 'Eina')),
          Text(widget.model.description,
              style: TextStyle(fontSize: 13.0, fontFamily: 'Biotif Book')),
          Text(widget.model.game,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                  fontFamily: 'Shapiro')),
          _tagsLive()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_headerLive(), _bottomLive()],
        ),
      ),
    );
  }
}
