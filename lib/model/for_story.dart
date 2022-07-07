
enum MediaType {
  image,
  video,
}
class Stories {
  final String url;
  final MediaType media;
  final Duration duration;

  const Stories({
    required this.url,
    required this.media,
    required this.duration,
  });
}