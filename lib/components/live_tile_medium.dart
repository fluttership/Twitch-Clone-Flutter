import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:twitch_clone/model/live.dart';

class LiveTileMedium extends StatefulWidget {
  final LiveModel model;
  LiveTileMedium({Key key, @required this.model}) : super(key: key);

  @override
  _LiveTileMediumState createState() => _LiveTileMediumState();
}

class _LiveTileMediumState extends State<LiveTileMedium> {
  String _showViews() {
    return widget.model.views < 1000
        ? widget.model.views.toString()
        : '${(widget.model.views / 1000).toStringAsFixed(1)}K Viewers';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        width: 370.0,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: FadeInImage.memoryNetwork(
                        image: widget.model.cover,
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      left: 6.0,
                      child: Card(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                          child: Center(
                            child: Text(
                              'LIVE',
                              style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 6.0,
                      left: 6.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [
                                0.7,
                                0.7
                              ],
                                  colors: [
                                Color.fromARGB(100, 0, 0, 0),
                                Color.fromARGB(100, 0, 0, 0)
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                            child: Center(
                              child: Text(
                                _showViews(),
                                style: TextStyle(color: Colors.white, fontFamily: 'Eina'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
