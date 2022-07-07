import 'package:flutter/material.dart';
import 'package:history_anon_tech/main_page.dart';

void main() {
  runApp(StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Story App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: MainPage(),
    );
  }
}