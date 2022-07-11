// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:history_anon_tech/camera/camera.dart';
import 'package:history_anon_tech/camera/media_page.dart';
import 'package:history_anon_tech/camera/view_video.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../main_page.dart';
import 'package:history_anon_tech/model/for_story.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {

  CameraScreen({Key? key}) : super(key: key);
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  FileType? _pickingType;

  @override
  void initState() {

    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {

    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.done) {

                  return Container(
                    padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController));
                } else {

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            top: 0.0,
            child: Container(
            color: Colors.transparent,
              padding: EdgeInsets.only(top: 45),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => const MainPage()));},
                          icon: Icon(Icons.clear_sharp,
                            color: Colors.white,))
                    ],
                  )
                ],
              ),
          ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(Icons.image,
                            color: Colors.white,
                          ),
                          onPressed: () {

                            chooseFile(context);
                          }),
                      GestureDetector(
                        onLongPress: () async {

                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecoring = true;
                          });
                        },
                        onLongPressUp: () async {

                          moveVideo(context);
                        },
                        onTap: () {

                          if (!isRecoring) takePhoto(context);
                        },
                        child: isRecoring
                            ? Icon(
                          Icons.radio_button_on,
                          color: Colors.redAccent,
                          size: 80,
                        )
                            : Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          onPressed: () async {

                            setState(() {

                              iscamerafront = !iscamerafront;
                              transform = transform + pi;
                            });
                            int cameraPos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras[cameraPos], ResolutionPreset.max);
                            cameraValue = _cameraController.initialize();
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Нажмите и удерживайте для записи видео",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {

    XFile fileImg = await _cameraController.takePicture();
    String img = fileImg.path;
    print(img);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => MediaSavePage(
              pathImg: img,
            )));
  }

  void moveVideo(BuildContext context) async {

    XFile videopath = await _cameraController.stopVideoRecording();
    setState(() {
      isRecoring = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => VideoViewPage(
              pathVid: videopath.path,
            )));
  }

  void chooseFile(BuildContext context) async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if ( result != null){

      String? file = result.files.single.path;
      if (file != null) {

        Navigator.push(context, MaterialPageRoute(builder: (builder) => VideoViewPage(pathVid: file)));
        if (_pickingType == FileType.video){

          Navigator.push(context, MaterialPageRoute(builder: (builder) => VideoViewPage(pathVid: file)));
        }else{

          Navigator.push(context, MaterialPageRoute(builder: (builder) => MediaSavePage(pathImg: file)));
        }
      }
    }
}
}
