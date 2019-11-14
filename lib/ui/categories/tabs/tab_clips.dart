import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/clip_tile_large.dart';
import 'package:twitch_clone/controller/clips.dart';

class TabClips extends StatefulWidget {
  final String categorie;

  TabClips({Key key, this.categorie}) : super(key: key);

  @override
  _TabClipsState createState() => _TabClipsState();
}

class _TabClipsState extends State<TabClips> {
  Widget _clipsList() {
    ClipsController controller = Provider.of<ClipsController>(context);
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return ClipTileLarge(
              model: controller.list[index], categorie: widget.categorie);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      children: <Widget>[
        Consumer<ClipsController>(
          builder: (context, clipController, widget) {
            return _clipsList();
          },
        )
      ],
    );
  }
}
