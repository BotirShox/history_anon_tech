import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaSavePage extends StatefulWidget {
  const MediaSavePage({super.key});

  @override
  _MediaSavePageState createState() => _MediaSavePageState();
}
class _MediaSavePageState extends State<MediaSavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Image.network("https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785081-676-949.jpg",
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
            onPressed: () => Navigator.of(context).pop(),
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
          onPressed: () {  },
        ),
      ),
    );
  }
}