import 'package:flutter/material.dart';

import 'package:mausam/Activities/Home.dart';
import 'package:mausam/Activities/Loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) =>const Loading(),
      "/home" : (context) => const Home(),
      "/loading" : (context) => const Loading(),
    },
  ));
}

