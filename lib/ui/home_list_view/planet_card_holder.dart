import 'package:flutter/material.dart';
import 'package:flutter_app/models/planet.dart';
import 'package:flutter_app/ui/detail/planet_detail.dart';
import 'package:flutter_app/ui/style/colors.dart';
import 'package:flutter_app/ui/style/separator.dart';
import '../style/app_text_style.dart';

class PlanetCardHolder extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetCardHolder(this.planet, {this.horizontal = true});

  PlanetCardHolder.vertical(this.planet) : horizontal = false;

  Widget _planetValue({String value, String image}) {
    return new Row(children: <Widget>[
      new Image.asset(image, height: 12.0),
      new Container(width: 8.0),
      new Text(planet.gravity, style: Style.smallTextStyle),
    ]);
  }

  @override

  /// PLANET THUMBNAIL ///
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    /// PLANET CARD CONTENT ///
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            planet.name,
            style: Style.headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(
            planet.location,
            style: Style.smallTextStyle,
          ),
          Separator(),
          new Row(
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          )
        ],
      ),
    );

    /// PLANET CARD ///
    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(cardBg),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    /// ON PLANET TAP LISTENER ///
    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new PlanetDetail(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: [
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
