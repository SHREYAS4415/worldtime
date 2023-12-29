

import 'package:flutter/material.dart';
import 'package:wt/pagess/Home.dart';
import 'package:wt/pagess/Loading.dart';
import 'package:wt/pagess/creat_location.dart';

void main() {
  runApp(
    MaterialApp
      (initialRoute: '/',
      routes: {
        '/':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/creat_location':(context)=>creat_location(),
      }
      )
  );
}

