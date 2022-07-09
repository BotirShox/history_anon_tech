import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_page.dart';

class StoryPage extends StatefulWidget {
  late String path;

  StoryPage({super.key, required this.path, required List<dynamic> stories});

  @override
  _StoryPageState createState() => _StoryPageState(path);
}
class _StoryPageState extends State<StoryPage> {

  final String path;

  _StoryPageState(this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:
      path != null ? Image.file(File(path),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ) : new Image.network("https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785081-676-949.jpg",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () {Navigator.push(context, CupertinoPageRoute(
            builder: (context) => const MainPage()));},
        child: const Icon(Icons.clear_sharp,
          color: Colors.white,),
      ),
    );
  }
}