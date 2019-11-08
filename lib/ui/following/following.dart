import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/channel_tile_medium.dart';
import 'package:twitch_clone/components/live_tile_small.dart';
import 'package:twitch_clone/controller/channel.dart';
import 'package:twitch_clone/controller/live.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  Widget _followingList() {
    LiveController controller = Provider.of<LiveController>(context);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: controller.lives.length,
      itemBuilder: (context, index) {
        return LiveTileSmall(model: controller.lives[index]);
      },
    );
  }

  Widget _channelList() {
    ChannelController controller = Provider.of<ChannelController>(context);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: controller.channel.length,
      itemBuilder: (context, index) {
        return ChannelTileSmall(model: controller.channel[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 15.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 15.0),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schelter'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text('LIVE CHANNELS', style: TextStyle(fontFamily: 'Eina')),
        ),
        Consumer<LiveController>(
          builder: (context, liveController, widget) {
            return _followingList();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text('OFFLINE CHANNELS', style: TextStyle(fontFamily: 'Eina'),),
        ),
        Consumer<ChannelController>(
          builder: (context, channelController, widget) {
            return _channelList();
          },
        )
      ],
    );
  }
}
