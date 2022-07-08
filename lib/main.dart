import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:history_anon_tech/main_page.dart';
import 'camera/camera_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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