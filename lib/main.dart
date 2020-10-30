import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home_list_view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planets",
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
