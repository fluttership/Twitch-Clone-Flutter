import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/controller/channel.dart';
import 'package:twitch_clone/controller/live.dart';
import 'package:twitch_clone/ui/browse.dart';
import 'package:twitch_clone/ui/discover.dart';
import 'package:twitch_clone/ui/following.dart';
import 'package:twitch_clone/utils/constants.dart';
import 'package:twitch_clone/utils/custom_icons.dart';

void main() => runApp(TwitchClone());

class TwitchClone extends StatefulWidget {
  @override
  _TwitchCloneState createState() => _TwitchCloneState();
}

class _TwitchCloneState extends State<TwitchClone> {
  bool _isDark = false;
  int _selectedIndex = 0;
  static const following = 0;
  static const discover = 1;
  static const browse = 2;
  Widget child;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            _isDark ? Constants.darkPrimary : Constants.lightPrimary,
        statusBarBrightness: _isDark ? Brightness.dark : Brightness.light));
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

  void _selectPage(index) {
    setState(() {
      switch (index) {
        case following:
          child = Following();
          break;
        case discover:
          child = Discover();
          break;
        case browse:
          child = Browse();
          break;
      }
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
        )
      ],
      child: MaterialApp(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        theme: _isDark ? Constants.darkTheme : Constants.lightTheme,
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
            backgroundColor:
                _isDark ? Constants.darkAccent : Constants.lightPrimary,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                    color: Constants.twitchMainColor),
                title: Text(
                  'Following',
                  style: TextStyle(
                      fontFamily: 'Biotif Book',
                      color: Constants.twitchMainColor),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore, color: Constants.twitchMainColor),
                title: Text(
                  'Discover',
                  style: TextStyle(
                      fontFamily: 'Biotif Book',
                      color: Constants.twitchMainColor),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_none, color: Constants.twitchMainColor),
                title: Text(
                  'Browse',
                  style: TextStyle(
                      fontFamily: 'Biotif Book',
                      color: Constants.twitchMainColor),
                ),
              )
            ],
            onTap: (index) {
              _selectPage(index);
            },
          ),
          body: SizedBox.expand(
            child: child,
          ),
        ),
      ),
    );
  }
}
