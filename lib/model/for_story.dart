
enum MediaType {
  image,
  video,
}
class Stories {
  final String file;
  final MediaType media;
  final Duration duration;

  const Stories({
    required this.file,
    required this.media,
    required this.duration,
  });
}