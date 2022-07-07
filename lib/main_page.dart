import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_anon_tech/view/home_widget.dart';
import 'constants/colour.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: background,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  Text("Главная", style: TextStyle (fontSize: 35, fontWeight: FontWeight.w500,) )
                ],
                mainAxisAlignment: MainAxisAlignment.start,

              ),
              Container(
                height: 120,
              padding: EdgeInsets.only(top: 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  addStoryWidget(size: 40, iconData: Icons.add, context: context),
                  SizedBox(
                    width: 10,
                  ),
                  myStoryWidget(size: 80, text: "my", context: context, myImageUrl: "https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785076-564-1002.jpg", showStrip: true),
                  Container(
                    height: 100,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(10, (index) => storyWidget(size: 80, context: context, text: "text", showStrip: true, imageUrl: "https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785081-676-949.jpg")),
                    ),
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
