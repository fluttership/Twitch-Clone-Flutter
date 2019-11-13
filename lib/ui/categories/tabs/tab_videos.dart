import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/video_tile_medium.dart';
import 'package:twitch_clone/controller/live.dart';

class TabVideos extends StatefulWidget {
  @override
  _TabVideosState createState() => _TabVideosState();
}

class _TabVideosState extends State<TabVideos> {
  @override
  Widget build(BuildContext context) {
    Widget _videosList() {
      LiveController controller = Provider.of<LiveController>(context);
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.lives.length,
        itemBuilder: (context, index) {
          return VideoTileMedium(model: controller.lives[index]);
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      children: <Widget>[
        Consumer<LiveController>(
          builder: (context, videoController, widget) {
            return _videosList();
          },
        )
      ],
    );
  }
}