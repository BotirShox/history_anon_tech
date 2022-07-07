import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_page.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}
class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Image.network("https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785081-676-949.jpg",
      fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => const MainPage()));},
          child: const Icon(Icons.clear_sharp,
          color: Colors.white,),
        ),
    );
  }
}