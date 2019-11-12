import 'package:flutter/material.dart';
import 'package:twitch_clone/ui/browse/tabs/tab_categories.dart';
import 'package:twitch_clone/ui/browse/tabs/tab_live_channels.dart';
import 'package:twitch_clone/utils/constants.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0),
          child: Text(
            'Browse',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schelter'),
          ),
        ),
        TabBar(
          controller: _tabController,
          labelColor: Constants.twitchMainColor,
          indicatorColor: Constants.twitchMainColor,
          unselectedLabelColor: Constants.isDark ? Colors.white : Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Tab(
              child: Text('Categories', style: TextStyle(fontFamily: 'Eina')),
            ),
            Tab(
              child: Text('Live Channels', style: TextStyle(fontFamily: 'Eina')),
            )
          ],
        ),
        Expanded(
          child: TabBarView(
            children: <Widget>[TabCategories(), TabLiveChannels()],
            controller: _tabController,
          ),
        )
      ],
    );
  }
}
