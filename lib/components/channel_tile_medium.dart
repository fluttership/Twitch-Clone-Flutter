import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/model/channel.dart';

class ChannelTileSmall extends StatefulWidget {
  final ChannelModel model;

  ChannelTileSmall({Key key, @required this.model}) : super(key: key);

  @override
  _ChannelTileState createState() => _ChannelTileState();
}

class _ChannelTileState extends State<ChannelTileSmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            child: FadeInImage.memoryNetwork(
              image: widget.model.image,
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          widget.model.user,
          style: TextStyle(fontFamily: 'Eina', fontSize: 16.0),
        ),
        subtitle: Text(
          widget.model.newVideos <= 1
              ? '${widget.model.newVideos} new video'
              : '${widget.model.newVideos} new videos',
          style: TextStyle(
              fontSize: 13.0, color: Colors.grey[700], fontFamily: 'Shapiro'),
        ),
        trailing: Visibility(
          visible: widget.model.newVideos > 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: Colors.grey[400],
              width: 10.0,
              height: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
