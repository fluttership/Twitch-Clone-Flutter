import 'package:flutter/material.dart';
import 'package:twitch_clone/model/channel.dart';

class ChannelController extends ChangeNotifier {
  List<ChannelModel> channel = [
    ChannelModel(
      user: 'alanzoka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRmI2ckayYfoO6ft7h_2ZVoaM9doeUZMxjBZREDM2PjfdZyTrI1',
      newVideos: 2
    ),
    ChannelModel(
      user: 'gratis150ml',
      image: 'https://static-cdn.jtvnw.net/jtv_user_pictures/774dcf07-a145-4fdf-8f5d-2e2f24a7cb0f-profile_image-300x300.png',
      newVideos: 1
    ),
    ChannelModel(
      user: 'jukes',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRF8cFIeJcfyfF8hQsTyhIn1Y5pTA0evVGiJAHYONh-e2X9RksX',
      newVideos: 7
    ),
    ChannelModel(
      user: 'YoDa',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSv4ILwbM3CrlL88uVl6OpsBmw69dItR-GfR1O9IQjyvRmr3Ww0',
      newVideos: 2
    ),
    ChannelModel(
      user: 'pimpimenta',
      image: 'https://i.imgur.com/uxbpr9c.png',
      newVideos: 0
    ),
    ChannelModel(
      user: 'BrTT',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTKLSL-3uZMjgoFivZzS91VdaYu0Thk8XPC6FQDTyJm4KA7JyGZ',
      newVideos: 3
    ),
    ChannelModel(
      user: 'PatoPapao',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMSUNertZY90EGEZbijy4Etu_KYW-vVc4GVlgK1WrKoct55krA',
      newVideos: 0
    ),
    ChannelModel(
      user: 'Ninja',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFUo1fczbOWzeLQG4kX1zJ1R9lzXjA9zBaz5kGt-shaH_RIRGe',
      newVideos: 0
    )
  ];
}