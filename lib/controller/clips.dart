import 'package:flutter/material.dart';
import 'package:twitch_clone/model/clips.dart';

class ClipsController extends ChangeNotifier {
  List<ClipsModel> list = [
    ClipsModel(
        userImage: 'https://i.imgur.com/6idgurj.jpg',
        user: 'Jukes',
        date: 'Nov 17',
        categorie: 'categorie',
        isFavorite: false,
        cover: 'https://i.imgur.com/fxW4aZ7.jpg',
        views: 84578,
        duration: '0:34',
        description: 'Jukes explicando a jogada'),
    ClipsModel(
        userImage: 'https://i.imgur.com/Sb4OFnq.jpg',
        user: 'YoDa',
        date: 'Nov 25',
        categorie: 'categorie',
        isFavorite: false,
        cover: 'https://i.imgur.com/kZcMpeJ.jpg',
        views: 98451,
        duration: '0:22',
        description: 'n/a brotheragem kkkkkkkkkkkkk'),
    ClipsModel(
        userImage: 'https://i.imgur.com/AeTmZf2.jpg',
        user: 'Rakin',
        date: 'Dec 08',
        categorie: 'categorie',
        isFavorite: false,
        cover: 'https://i.imgur.com/4xFichS.jpg',
        views: 79548,
        duration: '0:48',
        description: 'MAIN VLAD VOLTOU'),
  ];
}
