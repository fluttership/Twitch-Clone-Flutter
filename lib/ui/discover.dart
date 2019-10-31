import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/categories_tile.dart';
import 'package:twitch_clone/controller/categories.dart';
import 'package:twitch_clone/utils/constants.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  Widget _categoriesList() {
    CategoriesController controller =
        Provider.of<CategoriesController>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 2,
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 15.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 15.0),
          child: Text(
            'Discover',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schelter'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              Text('RECOMMENDED '),
              Text(
                'CATEGORIES',
                style: TextStyle(color: Constants.twitchMainColor),
              )
            ],
          ),
        ),
        Consumer<CategoriesController>(
          builder: (context, categorieController, widget) {
            return _categoriesList();
          },
        )
      ],
    );
  }
}
