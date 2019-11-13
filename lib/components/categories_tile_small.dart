import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/categories.dart';

class CategoriesTileSmall extends StatefulWidget {
  final CategoriesModel model;

  CategoriesTileSmall({Key key, @required this.model}) : super(key: key);

  @override
  _CategoriesTileSmallState createState() => _CategoriesTileSmallState();
}

class _CategoriesTileSmallState extends State<CategoriesTileSmall> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K Viewers';
  }

  Widget _imageCover() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        width: 50.0,
        height: 80.0,
        child: FadeInImage.memoryNetwork(
          image: widget.model.image,
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _infoCategorie() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_title(), _views(), _tags()],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5.0),
      child: Text(
        widget.model.name,
        style: TextStyle(fontFamily: 'Eina'),
        overflow: TextOverflow.fade,
      ),
    );
  }

  Widget _views() {
    return Text(_showViews(),
        style: TextStyle(
            fontFamily: 'Shapiro', fontSize: 14.0, color: Colors.grey[700]));
  }

  Widget _tags() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
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
      padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_imageCover(), _infoCategorie()],
      ),
    );
  }
}
