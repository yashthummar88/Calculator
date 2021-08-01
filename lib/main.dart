import 'package:flutter/material.dart';

import 'buttons.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => MyApp(),
      },
    ),
  );
}
