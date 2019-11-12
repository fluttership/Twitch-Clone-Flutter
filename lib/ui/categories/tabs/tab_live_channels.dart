import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/live_tile_large.dart';
import 'package:twitch_clone/controller/live.dart';

class TabLiveChannels extends StatefulWidget {
  @override
  _TabLiveChannelsState createState() => _TabLiveChannelsState();
}

class _TabLiveChannelsState extends State<TabLiveChannels> {
  

  @override
  Widget build(BuildContext context) {
    Widget _categoriesList() {
      LiveController controller =
          Provider.of<LiveController>(context);
      return ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.lives.length,
          itemBuilder: (context, index) {
            return LiveTileLarge(model: controller.lives[index]);
          },
        );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      children: <Widget>[
        Consumer<LiveController>(
          builder: (context, categorieControler, widget) {
            return _categoriesList();
          },
        )
      ],
    );
  }
}