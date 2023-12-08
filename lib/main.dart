import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_weather/utils/globals.dart';
import 'package:word_weather/utils/methods.dart';
import 'package:word_weather/views/auth/sign_in.dart';
import 'package:word_weather/views/home.dart';
import 'package:word_weather/views/quizzes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return userLocalSettings!.get("first_time")
                ? const Quizzes()
                : FirebaseAuth.instance.currentUser == null
                    ? const SignIn()
                    : const Home();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: blue));
          } else {
            return Center(child: Text(snapshot.error.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
          }
        },
      ),
      theme: ThemeData.dark(),
    );
  }
}
