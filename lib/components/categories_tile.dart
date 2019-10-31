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
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Text(
        widget.model.name.length > 15
            ? '${widget.model.name.substring(0, 15)} ...'
            : widget.model.name,
        style: TextStyle(fontFamily: 'Eina', fontSize: 14.0),
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
            return _tagText(widget.model.tags[index]);
          },
        ),
      ),
    );
  }

  Widget _tagText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Container(
          color: Colors.grey[300],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(text,
                  style: TextStyle(fontSize: 12.0, fontFamily: 'Biotif Book')),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _categoryImage(),
            _categoryName(),
            _categoryViews(),
            _categoryTags()
          ],
        ),
      ),
    );
  }
}
