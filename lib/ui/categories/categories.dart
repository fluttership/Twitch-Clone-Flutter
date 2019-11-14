import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/components/text_tag.dart';
import 'package:twitch_clone/model/categories.dart';
import 'package:twitch_clone/ui/browse/tabs/tab_live_channels.dart';
import 'package:twitch_clone/ui/categories/tabs/tab_clips.dart';
import 'package:twitch_clone/ui/categories/tabs/tab_videos.dart';
import 'package:twitch_clone/utils/constants.dart';
import 'package:twitch_clone/utils/custom_icons.dart';

class Categories extends StatefulWidget {
  final CategoriesModel model;

  Categories({Key key, this.model}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  String _convertNumber(int number) {
    return number < 1000
        ? number.toString()
        : '${(number / 1000).toStringAsFixed(1)}K';
  }

  Widget _actionButtons(IconData icon, Function function) {
    return IconButton(
      icon: Icon(icon),
      onPressed: function,
    );
  }

  Widget _imageCover() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 140.0,
        width: 100.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: FadeInImage.memoryNetwork(
            image: widget.model.image,
            placeholder: kTransparentImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _categorieInfo() {
    return Expanded(
      child: Container(
        height: 155.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_topInfo(), _middleInfo(), _bottomInfo()],
        ),
      ),
    );
  }

  Widget _topInfo() {
    return Text(widget.model.name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: 'Eina', fontSize: 25.0));
  }

  Widget _middleInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _middleText(widget.model.views, 'Viewers'),
        SizedBox(width: 5.0),
        _middleText(widget.model.follow, 'Followers')
      ],
    );
  }

  Widget _middleText(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(_convertNumber(number),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Shapiro',
                fontSize: 15.0,
                color: Constants.isDark ? Colors.white : Colors.black)),
        Text(' $text',
            style: TextStyle(
                fontFamily: 'Shapiro',
                fontSize: 15.0,
                color: Colors.grey[600])),
      ],
    );
  }

  Widget _bottomInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_categoryTags()],
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
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          _actionButtons(CustomIcons.cast, () {}),
          _actionButtons(CustomIcons.favorite_border, () {}),
        ],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_imageCover(), _categorieInfo()],
          ),
          TabBar(
            controller: _tabController,
            labelColor: Constants.twitchMainColor,
            indicatorColor: Constants.twitchMainColor,
            unselectedLabelColor:
                Constants.isDark ? Colors.white : Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                  child: Text('Live Channels',
                      style: TextStyle(fontFamily: 'Eina'))),
              Tab(child: Text('Videos', style: TextStyle(fontFamily: 'Eina'))),
              Tab(child: Text('Clips', style: TextStyle(fontFamily: 'Eina')))
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                TabLiveChannels(),
                TabVideos(),
                TabClips(categorie: widget.model.name),
              ],
            ),
          )
        ],
      ),
    );
  }
}
