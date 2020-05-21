import 'package:flutter/material.dart';
import 'package:music_player/pages/detailPage.dart';
import 'package:music_player/pages/home.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/',
      
      routes: {
        '/':(context) => Home(),
        '/detail': (context) => DetailPage(),
      },
    ));

