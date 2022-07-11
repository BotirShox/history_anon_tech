import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../database/sqlite_service.dart';
import '../story_pages/story.dart';

class VideoViewPage extends StatefulWidget {
  VideoViewPage({Key? key, required this.pathVid}) : super(key: key);
  late String pathVid;

  @override
  _VideoViewPageState createState() => _VideoViewPageState(pathVid);
}

class _VideoViewPageState extends State<VideoViewPage> {
  late VideoPlayerController _controller;
  final String pathVid;
 // late SqliteService _sqliteService;

  _VideoViewPageState(this.pathVid);

  @override
  void initState() {
    super.initState();
   // this._sqliteService= SqliteService();
   // this._sqliteService.initializeDB().whenComplete(() async {
     // await _refreshNotes();
    _controller = VideoPlayerController.file(File(widget.pathVid))
      ..initialize().then((_) {
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          width: 328,
          height: 40,
      child: FloatingActionButton(onPressed: () {
        final value = Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => StoryPage(
                  path: pathVid,
                )));
        Fluttertoast.showToast(msg: "Видео успено опубликовано!");
      },
      backgroundColor: Color(0xFF8F8F8F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text("Опубликовать"),
      ),
      ),
      backgroundColor: Colors.black,
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
                await GallerySaver.saveVideo(widget.pathVid);
                Fluttertoast.showToast(
                  msg: "Видео успешно сохранено!",
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}