import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/categories_tile.dart';
import 'package:twitch_clone/components/live_tile_medium.dart';
import 'package:twitch_clone/controller/categories.dart';
import 'package:twitch_clone/controller/live.dart';
import 'package:twitch_clone/utils/constants.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  Widget _titleDiscover() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 15.0),
      child: Text(
        'Discover',
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Schelter'),
      ),
    );
  }

  Widget _recomendedCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: <Widget>[
          Text('RECOMMENDED ', style: TextStyle(fontFamily: 'Eina'),),
          Text(
            'CATEGORIES',
            style: TextStyle(color: Constants.twitchMainColor, fontFamily: 'Eina'),
          )
        ],
      ),
    );
  }

  Widget _categoriesList() {
    CategoriesController controller =
        Provider.of<CategoriesController>(context);
    return Container(
      height: 260.0,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategorieTile(model: controller.categories[index]);
        },
      ),
    );
  }

  Widget _mediumLiveList() {
    LiveController controller = Provider.of<LiveController>(context);
    return Container(
      height: 330.0,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.lives.length,
        itemBuilder: (context, index) {
          return LiveTileMedium(model: controller.lives[index]);
        },
      ),
    );
  }

  Widget _genericHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(text, style: TextStyle(fontFamily: 'Eina'),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 15.0),
      children: <Widget>[
        _titleDiscover(),
        _genericHeader('RECOMENDED LIVE CHANNELS'),
        Consumer<LiveController>(
          builder: (context, liveController, widget) {
            return _mediumLiveList();
          },
        ),
        _recomendedCategories(),
        Consumer<CategoriesController>(
          builder: (context, categorieController, widget) {
            return _categoriesList();
          },
        )
      ],
    );
  }
}
