import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/categories.dart';

class CategorieTileMedium extends StatefulWidget {
  final CategoriesModel model;

  CategorieTileMedium({Key key, @required this.model}) : super(key: key);

  @override
  _CategorieTileMediumState createState() => _CategorieTileMediumState();
}

class _CategorieTileMediumState extends State<CategorieTileMedium> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K Viewers';
  }

  Widget _categoryImage() {
    return Container(
      width: 130.0,
      height: 185.0,
      child: FadeInImage.memoryNetwork(
        image: widget.model.image,
        placeholder: kTransparentImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _categoryName() {
    return Flexible(
      child: Container(
        width: 130.0,
        padding: const EdgeInsets.only(right: 5.0),
        child: Text(widget.model.name,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontFamily: 'Eina', fontSize: 14.0)),
      ),
    );
  }

  Widget _categoryViews() {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Text(
        _showViews(),
        style: TextStyle(fontFamily: 'Shapiro', fontSize: 12.0),
      ),
    );
  }

  Widget _categoryTags() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(
        height: 20.0,
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.model.tags.length,
          itemBuilder: (BuildContext context, int index) {
            return TextTag(text: widget.model.tags[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _categoryImage(),
          _categoryName(),
          _categoryViews(),
          _categoryTags()
        ],
      ),
    );
  }
}
