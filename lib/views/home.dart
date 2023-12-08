import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:word_weather/utils/globals.dart';
import 'package:word_weather/views/action.dart';
import 'package:word_weather/views/chat_room.dart';
import 'package:word_weather/views/quizzes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _screensController = PageController();

  final Map<int, Widget> _screens = <int, Widget>{0: const Quizzes(), 1: const Acts(), 2: Container(), 3: const ChatRoom()};

  @override
  void dispose() {
    _screensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: gray.withOpacity(.1),
        onTabChange: (int index) => _screensController.jumpToPage(index),
        selectedIndex: currentPage,
        rippleColor: gray,
        hoverColor: gray,
        haptic: true,
        tabBorderRadius: 15,
        curve: Curves.linear,
        duration: 500.ms,
        gap: 8,
        activeColor: teal,
        iconSize: 20,
        tabBackgroundColor: teal.withOpacity(.1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        tabs: const <GButton>[
          GButton(icon: FontAwesome.paper_plane, text: 'Home'),
          GButton(icon: FontAwesome.adn, text: 'Actions'),
          GButton(icon: Bootstrap.joystick, text: 'Quiz'),
          GButton(icon: Bootstrap.chat, text: 'Chat'),
        ],
      ),
      body: PageView.builder(physics: const NeverScrollableScrollPhysics(), controller: _screensController, itemCount: 4, itemBuilder: (BuildContext context, int index) => _screens[index]),
    );
  }
}
