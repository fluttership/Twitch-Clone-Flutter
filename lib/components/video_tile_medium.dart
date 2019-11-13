import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/live.dart';

class VideoTileMedium extends StatefulWidget {
  final LiveModel model;
  VideoTileMedium({Key key, @required this.model}) : super(key: key);

  @override
  _VideoTileMediumState createState() => _VideoTileMediumState();
}

class _VideoTileMediumState extends State<VideoTileMedium> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K Views';
  }

  String _showDate() {
    DateTime date = DateTime.parse(widget.model.date);
    Duration duration = DateTime.now().difference(date);
    return '${duration.inDays} days ago';
  }

  Widget _badgeDuration() {
    return Positioned(
      top: 6.0,
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
                widget.model.duration,
                style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _badgeViews() {
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

  Widget _badgeDate() {
    return Positioned(
      bottom: 6.0,
      right: 6.0,
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
                _showDate(),
                style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageCover() {
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

  Widget _headerLive() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _imageCover(),
        _badgeDuration(),
        _badgeViews(),
        _badgeDate()
      ],
    );
  }

  Widget _userImageLive() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 40.0,
        height: 40.0,
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

  Widget _bottomLive() {
    return Row(
      children: <Widget>[_userImageLive(), _infoLive()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: 370.0,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: <Widget>[_headerLive(), _bottomLive()],
            ),
          ),
        ),
      ),
    );
  }
}
