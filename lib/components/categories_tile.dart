import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/model/categories.dart';

class CategorieTile extends StatefulWidget {
  final CategoriesModel model;

  CategorieTile({Key key, @required this.model}) : super(key: key);

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 130.0,
            height: 185.0,
            child: FadeInImage.memoryNetwork(
              image: widget.model.image,
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(widget.model.name.length > 15
                ? '${widget.model.name.substring(0, 15)} ...'
                : widget.model.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),),
          )
        ],
      ),
    );
  }
}
