import 'package:flutter/material.dart';
import 'package:flutter_app/models/planet.dart';
import 'package:flutter_app/ui/home_list_view/planet_card_holder.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => new PlanetCardHolder(planets[index]),
        itemCount: planets.length,
        itemExtent: 152.0,
        padding: new EdgeInsets.symmetric(vertical: 16.0),
      ),

    );
  }
}
