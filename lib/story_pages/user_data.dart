import 'package:history_anon_tech/model/for_story.dart';
/*
//Create a model
class Media{
  final int id;
  final String image;
  final String video;

  Media({required this.id, required this.image, required this.video});

  Media.fromMap(Map<String, dynamic> item):
        id=item["id"], image= item["image"], video = item["video"];

  Map<String, Object> toMap(){
    return {'id':id, 'image':image, 'video':video};
  }
}
*/

  final List<Stories> stories = [
    const Stories(
      file: 'https://c.tenor.com/a_UAXIcmHycAAAAC/haha.gif',
      media: MediaType.image,
      duration: Duration(seconds: 5),
    ),
    const Stories(
      file: 'https://c.tenor.com/I06MU4HtDxYAAAAC/laughing-shirley-temple.gif',
      media: MediaType.image,
      duration: Duration(seconds: 5),
    ),
    const Stories(
      file: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      media: MediaType.image,
      duration: Duration(seconds: 5),
    ),
    const Stories(
      file: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      media: MediaType.video,
      duration: Duration(seconds: 15),
    ),
    const Stories(
      file: 'https://images6.fanpop.com/image/photos/41700000/It-s-a-girl-prettygirls-41785081-676-949.jpg',
      media: MediaType.image,
      duration: Duration(seconds: 5),
    ),
    const Stories(
      file: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      media: MediaType.video,
      duration: Duration(seconds: 15),
    ),
  ];


 