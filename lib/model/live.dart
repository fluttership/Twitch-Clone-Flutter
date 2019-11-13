import 'package:flutter/material.dart';

class LiveModel {
  String user;
  String description;
  String game;
  String cover;
  String userPicture;
  int views;
  List tags;
  String date;
  String duration;

  LiveModel(
      {@required this.user,
      @required this.description,
      @required this.game,
      @required this.cover,
      @required this.userPicture,
      @required this.views,
      @required this.tags,
      this.date,
      this.duration});
}
