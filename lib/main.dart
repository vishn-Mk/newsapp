import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/screens/discover_screen.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/news_view.dart';

void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}




