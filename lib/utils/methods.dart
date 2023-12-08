import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:word_weather/utils/globals.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> loadUserLocalSettings() async {
  try {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    userLocalSettings = await Hive.openBox('userLocalSettings');
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> load() async {
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA8IGOAW_njSM8NXwCLMTH9NJ901dWjggI",
        storageBucket: "world-weather-59c10.appspot.com",
        appId: "1:695310699399:android:4b6a8c3ea258f5ee196122",
        messagingSenderId: "695310699399",
        projectId: "world-weather-59c10",
      ),
    );
    await loadUserLocalSettings();
    if (userLocalSettings!.get("first_time") == null) {
      await userLocalSettings!.put("first_time", true);
    }
    if (userLocalSettings!.get("theme") == null) {
      await userLocalSettings!.put("theme", "dark");
    }
    if (userLocalSettings!.get("language") == null) {
      await userLocalSettings!.put("language", "en");
    }
    return true;
  } catch (e) {
    return false;
  }
}

void showSnack(String message, int type, BuildContext context) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: type == 1
          ? "Hey!"
          : type == 2
              ? "Warning"
              : "Error",
      message: message,
      contentType: type == 1
          ? ContentType.success
          : type == 2
              ? ContentType.warning
              : ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
