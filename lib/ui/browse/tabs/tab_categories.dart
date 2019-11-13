import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/components/categories_tile_small.dart';
import 'package:twitch_clone/controller/categories.dart';
import 'package:twitch_clone/ui/categories/categories.dart';

class TabCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _categoriesList() {
      CategoriesController controller =
          Provider.of<CategoriesController>(context);
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Categories(model: controller.categories[index]))),
              child: CategoriesTileSmall(model: controller.categories[index]));
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      children: <Widget>[
        Consumer<CategoriesController>(
          builder: (context, categorieControler, widget) {
            return _categoriesList();
          },
        )
      ],
    );
  }
}
