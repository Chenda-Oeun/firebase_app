import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.pink,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    centerTitle: true,
    elevation: 0,
  ),
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  primaryColor: Colors.pink
);
