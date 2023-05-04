import 'package:flutter/material.dart';
import 'package:world_time_new/pages/loading.dart';
import 'package:world_time_new/pages/home.dart';
import 'package:world_time_new/pages/location.dart';

void main() => runApp(MaterialApp(

  //Set initial route
  initialRoute: '/',

  //Define the routes
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const Location(),
  },
));