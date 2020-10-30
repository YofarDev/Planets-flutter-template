import 'package:flutter/material.dart';
import 'package:flutter_app/ui/style/colors.dart';
import 'package:flutter_app/ui/style/gradient_app_bar.dart';
import 'package:flutter_app/ui/home_list_view/home_page_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(background),
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Planets"),
          new HomePageBody(),
        ],
      ),
    );
  }
}
