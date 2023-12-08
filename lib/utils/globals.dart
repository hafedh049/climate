import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:word_weather/models/user_model.dart';

//COLORS
const Color teal = Color.fromARGB(255, 0, 207, 159);
const Color blue = Color.fromARGB(255, 0, 128, 178);
const Color gray = Color.fromARGB(255, 51, 56, 66);
const Color white = Color.fromARGB(255, 204, 204, 195);
const Color transparent = Colors.transparent;
Color yellow = Colors.yellow.shade600;

//VARS
Box? userLocalSettings;

int currentPage = 0;

String documentsPath = "";

UserModel? user;
