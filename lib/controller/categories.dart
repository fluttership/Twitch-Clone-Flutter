import 'package:flutter/widgets.dart';
import 'package:twitch_clone/model/categories.dart';

class CategoriesController extends ChangeNotifier {
  List<CategoriesModel> categories = [
    CategoriesModel(
      name: 'Fortnite',
      image: 'https://cdn.mos.cms.futurecdn.net/cbMSAnmNj4eFfES9SCFeeX-1200-80.jpg',
      views: 90580,
      tags: ['Shooter']
    ),
    CategoriesModel(
      name: 'Just Chatting',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGxq3wt82b7kllXIRSkpvBVj8M7y_g5MhDfx_GDYSLvri72v9K',
      views: 84785,
      tags: ['IRL']
    ),
    CategoriesModel(
      name: 'Call of Duty: Modern Warfare',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQOsJsbTmfEJ52uviSHBLjeAJnl1PEIMkXpqXBO1-YvERa8t4HE',
      views: 107548,
      tags: ['FPS', 'Shooter']
    ),
    CategoriesModel(
      name: 'Minecraft',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRxcLo8WOTxYYYdGRJjSUoEwsc-gp5gUcD5H1wNugD8EfShQcDR',
      views: 9784,
      tags: ['Adventure Game']
    ),
    CategoriesModel(
      name: 'Grand Theft Auto V',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQJrIBskeYyxHtXL_IF8vcSKrdCDi8fZv91vVmJX1qfWVrjL4sf',
      views: 47587,
      tags: ['Simulator']
    ),
    CategoriesModel(
      name: 'FIFA 20',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7tBHkBPsDjawRDdRcI4Hdi69jyCUzZ_0FqHVdW4KBDoFdR7kN',
      views: 10548,
      tags: ['Sport Game']
    ),
    CategoriesModel(
      name: 'League of Legends',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNhAjvFY8QUsZyEI38_mfeXj9KKDlSC9VfxQ8VpjYtWX7b9TR0',
      views: 101784,
      tags: ['MOBA']
    ),
    CategoriesModel(
      name: 'Apex Legends',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRd7zUrx-oHGqvPfJUoNJM4et2LB3_mFzOhx0jx4zqpi3kzXukE',
      views: 23548,
      tags: ['FPS', 'Shooter']
    ),
    CategoriesModel(
      name: 'World of Warcraft',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCS9ChDcmmDfmHIls9PBxQRKpGJxXL86c8-Ke13QLdw20Cw7-2',
      views: 24405,
      tags: ['MMORPG', 'RPG']
    )
  ];
}