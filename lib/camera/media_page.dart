import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:history_anon_tech/story_pages/story.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/for_story.dart';
import '../story_pages/user_data.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart'
;
/*
var databasesPath = await getDatabasesPath();
var path = join(databasesPath, "database.db");

// Check if the database exists
var exists = await databaseExists(path);

if (exists) async {
// Should happen only the first time you launch your application
print("Creating new copy from asset");

// Make sure the parent directory exists
try {
await Directory(dirname(path)).create(recursive: true);
} catch (_) {}

// Copy from asset
ByteData data = await rootBundle.load(join("assets", "database.db"));
List<int> bytes =
data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

// Write and flush the bytes written
await File(path).writeAsBytes(bytes, flush: true);

} else {
print("Opening existing database");
}
// open the database
Database db = await openDatabase(path, readOnly: true);
*/

class MediaSavePage extends StatelessWidget {

  const MediaSavePage({Key? key, required this.pathImg}) : super(key: key);
  final String pathImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Image.file(
        File(pathImg),
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
              GallerySaver.saveImage(pathImg);
              String a = GallerySaver.pleaseProvidePath;
              print(a);
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
            moveImage(context);
            Fluttertoast.showToast(msg: "Фото успено опубликовано!");
          },
        ),
      ),
    );
  }
  void moveImage(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => StoryPage(
              path: pathImg,
            )));
  }
}