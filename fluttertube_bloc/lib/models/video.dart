class Video {
  final String id;
  final String title;
  final String thumb;
  final String channel;

  Video({
    required this.id,
    required this.title,
    required this.thumb,
    required this.channel,
  });

  //o factory vai pegar o json e retornar um objeto que contém os dados do json
  factory Video.fromJson(Map<String, dynamic> json) {
    //quando passar um json para o factory ele vai retornar um objeto video com esses parâmetros
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumb: json['snippet']['thumbnails']['high']['url'],
      channel: json['snippet']['channelTitle'],
    );
  }
}
