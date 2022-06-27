class Author {
  final String first_name;
  final String last_name;

  Author({required this.first_name, required this.last_name});

  factory Author.fromJson(Map<String, dynamic> parsedJson) {
    return Author(
      first_name: parsedJson['first_name'],
      last_name: parsedJson['last_name'],
    );
  }
}

class Image {
  final int id;
  final String imageName;

  Image({required this.id, required this.imageName});

  factory Image.fromJson(Map<String, dynamic> parsedJson) {
    return Image(
      id: parsedJson['id'],
      imageName: parsedJson['imageName'],
    );
  }
}

class ImageList {
  final List<Image> images;

  ImageList({required this.images});

  factory ImageList.fromJson(List<dynamic> parsedJson) {
    List<Image> images = <Image>[];
    images = parsedJson.map((i) => Image.fromJson(i)).toList();
    return ImageList(images: images);
  }
}

class Avatar {
  final int id;
  final String first_name;
  final String last_name;
  final String avatar;
  final ImageList images;

  Avatar({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.avatar,
    required this.images,
  });

  factory Avatar.fromJson(Map<String, dynamic> parsedJson) {
    return Avatar(
      id: parsedJson['id'],
      first_name: parsedJson['first_name'],
      last_name: parsedJson['last_name'],
      avatar: parsedJson['avatar'],
      images: ImageList.fromJson(parsedJson['images']),
    );
  }
}

class Page {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final Author author;
  final List<Avatar> data;

  Page({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.author,
    required this.data,
  });

  factory Page.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Avatar> avatars = list.map((e) => Avatar.fromJson(e)).toList();

    return Page(
      page: parsedJson['page'],
      per_page: parsedJson['per_page'],
      total: parsedJson['total'],
      total_pages: parsedJson['total_pages'],
      author: Author.fromJson(parsedJson['author']),
      data: avatars,
    );
  }
}
