import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../main_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

class StoryPage extends StatefulWidget {
  late String path;

  StoryPage({Key? key, required this.path}):super(key:key);

  @override
  _StoryPageState createState() => _StoryPageState(path);
}
class _StoryPageState extends State<StoryPage>
    with SingleTickerProviderStateMixin {

  late VideoPlayerController _controller;
  final String path;

  _StoryPageState(this.path);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: lookupMimeType(path) == FileType.image ? Image.file(File(path),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ) :
      Container(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(
              builder: (context) => const MainPage()));
        },
        child: const Icon(Icons.clear_sharp,
          color: Colors.white,),
      ),
    );
  }
}