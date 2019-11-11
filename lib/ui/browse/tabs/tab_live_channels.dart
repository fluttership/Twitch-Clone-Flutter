import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/live_tile_large.dart';
import 'package:twitch_clone/controller/live.dart';

class TabLiveChannels extends StatefulWidget {

  @override
  _TabLiveChannelsState createState() => _TabLiveChannelsState();
}

class _TabLiveChannelsState extends State<TabLiveChannels> {
  Widget _liveList() {
    LiveController controller = Provider.of<LiveController>(context);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: controller.lives.length,
      itemBuilder: (context, index) {
        return LiveTileLarge(model: controller.lives[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Consumer<LiveController>(
          builder: (context, liveController, widget) {
            return _liveList();
          },
        )
      ],
    );
  }
}