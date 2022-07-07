import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_anon_tech/camera/camera_page.dart';
import 'package:history_anon_tech/camera/media_page.dart';
import 'package:history_anon_tech/story_pages/user_data.dart';
import '../story_pages/my.dart';
import '../story_pages/story.dart';

Widget addStoryWidget({required double size, required IconData iconData, required BuildContext context}){
  return GestureDetector(
    onTap: () {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const CameraPage()));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Icon(iconData, color: Colors.white,),
      ),
    )
  );
}

Widget myStoryWidget({required double size, required String myImageUrl,
  required bool showStrip, required String text, required BuildContext context}){
  return GestureDetector(
    onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => StoryScreen(stories: stories)));},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column (
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      Color(0x80FF5353),
                      Color(0x99FFA09C),
                      Colors.white
                    ],
                    stops: <double>[0.7, 0.8, 1],
                ),
                border: showStrip ? Border.all(color: Colors.transparent, width: 0.1) : null),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                        colors: [
                          Color(0x80FFD600),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80FFD600),
                        ],
                        stops: <double>[0.5, 0.55, 0.6, 0.8, 0.95, 1.0],
                        tileMode: TileMode.mirror
                    ),
                    border: showStrip ? Border.all(color: Colors.transparent, width:0.5) : null),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(myImageUrl),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(text),
        ],
      ),
    ),
  );
}

Widget storyWidget({required double size, required String imageUrl,
  required bool showStrip, required String text, required BuildContext context}){
  return GestureDetector(
    onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => const MediaSavePage()));},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column (
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0x80FF5353),
                    Color(0x99FFA09C),
                    Colors.white
                  ],
                  stops: <double>[0.7, 0.8, 1],
                ),
                border: showStrip ? Border.all(color: Colors.transparent, width: 0.1) : null),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                        colors: [
                          Color(0x80FFD600),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80EC9696),
                          Color(0x80FFD600),
                        ],
                        stops: <double>[0.5, 0.55, 0.6, 0.8, 0.95, 1.0],
                        tileMode: TileMode.mirror
                    ),
                    border: showStrip ? Border.all(color: Colors.transparent, width:0.5) : null),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(text),
        ],
      ),
    ),
  );
}