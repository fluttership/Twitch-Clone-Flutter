import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/controller/categories.dart';
import 'package:twitch_clone/controller/channel.dart';
import 'package:twitch_clone/controller/clips.dart';
import 'package:twitch_clone/controller/live.dart';
import 'package:twitch_clone/ui/browse/browse.dart';
import 'package:twitch_clone/ui/discover/discover.dart';
import 'package:twitch_clone/ui/following/following.dart';
import 'package:twitch_clone/utils/constants.dart';
import 'package:twitch_clone/utils/custom_icons.dart';

void main() => runApp(TwitchClone());

class TwitchClone extends StatefulWidget {
  @override
  _TwitchCloneState createState() => _TwitchCloneState();
}

class _TwitchCloneState extends State<TwitchClone> {
  int _selectedIndex = 0;
  static const following = 0;
  static const discover = 1;
  static const browse = 2;
  Widget child;
  final List<Widget> _children = [
    Following(),
    Discover(),
    Browse()
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Constants.isDark ? Constants.darkPrimary : Constants.lightPrimary,
        statusBarBrightness: Constants.isDark ? Brightness.dark : Brightness.light));
        _onTabTapped(_selectedIndex);
  }

  Widget _actionButtons(IconData icon, Function function) {
    return IconButton(
      icon: Icon(icon),
      onPressed: function,
    );
  }

  Widget _profilePicture() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 19.0,
        height: 19.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: Constants.profilePicture,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LiveController>.value(
          value: LiveController(),
        ),
        ChangeNotifierProvider<ChannelController>.value(
          value: ChannelController(),
        ),
        ChangeNotifierProvider<CategoriesController>.value(
          value: CategoriesController(),
        ),
        ChangeNotifierProvider<ClipsController>.value(
          value: ClipsController(),
        )
      ],
      child: MaterialApp(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        theme: Constants.isDark ? Constants.darkTheme : Constants.lightTheme,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: _profilePicture(),
            actions: <Widget>[
              _actionButtons(CustomIcons.cast, () {}),
              _actionButtons(CustomIcons.notifications_none, () {}),
              _actionButtons(CustomIcons.comment, () {}),
              _actionButtons(CustomIcons.search, () {})
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Constants.twitchMainColor,
            backgroundColor:
                Constants.isDark ? Constants.darkPrimary : Constants.lightPrimary,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Following',
                  style: TextStyle(fontFamily: 'Biotif Book'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text(
                  'Discover',
                  style: TextStyle(
                    fontFamily: 'Biotif Book',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_none),
                title: Text(
                  'Browse',
                  style: TextStyle(
                    fontFamily: 'Biotif Book',
                  ),
                ),
              )
            ],
            onTap: _onTabTapped
          ),
          body: _children[_selectedIndex],
        ),
      ),
    );
  }
}
