import 'package:flutter/cupertino.dart';
import 'package:twitch_clone/model/live.dart';

class LiveController extends ChangeNotifier {
  List<LiveModel> lives = [
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-01',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-02',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-03',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-04',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-05',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-06',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-07',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-08',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-09',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-10',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-11',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-12',
        duration: '01:45:22'),
    LiveModel(
        user: 'YoDa',
        description: 'Meczada na Stream do YoDa',
        game: 'League Of Legends',
        userPicture:
            'https://s2.glbimg.com/quLD8NyVUbYm87D55EDih_QzB48=/0x600/s.glbimg.com/po/tt2/f/original/2019/03/11/capa_1.png',
        cover:
            'https://1290779820.rsc.cdn77.org/screenshots/league-of-legends-636764988260065305.jpg',
        tags: ['Moba', 'Multiplayer'],
        views: 12145,
        date: '2019-10-14',
        duration: '01:45:22'),
    LiveModel(
        user: 'pimpimenta',
        description: 'BIRI IRL AHAHAHAHAH',
        game: 'Just Chatting',
        userPicture:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM4NCRln1i8k8Y98kNXGXj_IZin-MESwxCRlUuxhxaSRomkXRI',
        cover: 'https://imgur.com/EapAOWe.jpg',
        tags: ['Portuguese'],
        views: 2732,
        date: '2019-10-18',
        duration: '01:45:22')
  ];
}
