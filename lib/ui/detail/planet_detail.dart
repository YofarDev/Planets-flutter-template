import 'package:flutter/material.dart';
import 'package:flutter_app/models/planet.dart';
import 'package:flutter_app/ui/home_list_view/planet_card_holder.dart';
import 'package:flutter_app/ui/style/app_text_style.dart';
import 'package:flutter_app/ui/style/colors.dart';
import 'package:flutter_app/ui/style/separator.dart';

class PlanetDetail extends StatelessWidget {
  final Planet planet;

  PlanetDetail(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(background),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(transparentBg), new Color(background)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new PlanetCardHolder(
            planet,
            horizontal: true,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(planet.description, style: Style.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
