import 'package:flutter/material.dart';

class FontStyles {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle b1;
  final TextStyle b2;
  final TextStyle c;

  FontStyles()
      : h1 = const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        h2 = const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        h3 = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        h4 = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        h5 = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        b1 = const TextStyle(fontSize: 16),
        b2 = const TextStyle(fontSize: 14),
        c = const TextStyle(fontSize: 12);
}
