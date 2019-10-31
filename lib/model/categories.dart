import 'package:flutter/material.dart';

class CategoriesModel {
  String name;
  String image;
  int views;
  List tags;

  CategoriesModel(
      {@required this.name,
      @required this.image,
      @required this.views,
      @required this.tags});
}
