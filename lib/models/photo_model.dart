class Photo {
  final String id;
  final String title;
  final String url;

  Photo({required this.id, required this.url, required this.title});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'].toString(),
      title: json['title'],
      url: json['url'],
    );
  }
}

class PhotoList {
  final List<Photo> photos;

  PhotoList({required this.photos});

  factory PhotoList.fromJson(List<dynamic> parsedJson) {
    List<Photo> photos = <Photo>[];
    // == List<Photo> photos = List<Photo>();
    // 이번에 다루는 json 형태는 List of maps
    // 그래서 이번 factory method 의 인자는 Map<String, dynamic> 이 아닌
    // List<dynamic> 이 되어야 함

    photos = parsedJson.map((i) => Photo.fromJson(i)).toList();

    return PhotoList(photos: photos);
  }
}
