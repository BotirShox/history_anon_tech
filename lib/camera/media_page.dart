import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:history_anon_tech/story_pages/story.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/for_story.dart';
import '../story_pages/user_data.dart';


class MediaSavePage extends StatelessWidget {

  const MediaSavePage({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Image.file(
        File(path),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(width: 10.0),
          IconButton(
            icon: const Icon(
              Icons.save_alt,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () async {
              GallerySaver.saveImage(path);
              Fluttertoast.showToast(
                msg: "Фото успешно сохранено!",
              );
            },
          ),
        ],
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 328,
        height: 40,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF8F8F8F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text("Опубликовать"),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (builder) => StoryPage(path: path, stories: [],)),);
            Fluttertoast.showToast(msg: "Фото успено опубликовано!");
          },
        ),
      ),
    );
  }
}