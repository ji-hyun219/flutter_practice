class Product {
  final int id;
  final String name;
  final List<Image> images;

  Product({required this.id, required this.name, required this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['images'] as List;
    print(list.runtimeType); // returns List<dynamic>
    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();

    return Product(
        id: parsedJson['id'], name: parsedJson['name'], images: imagesList);

    // var imagesFromJson = parsedJson['images'];
    // List<Image> imagesList = imagesFromJson.cast<Image>();
    // id: parsedJson['id'], name: parsedJson['name'], images: imagesList);
    // 에러 발생..
    // 에러 내용은 아래와 같다
    // type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Image' in type cast

    // images: Image.fromJson(parsedJson['images'])
    // 에러 발생..
    // 에러 내용은 아래와 같다
    // Image object에 List<Image> 를 할당하지 않았기 때문에 에러가 발생.
  }
}

class Image {
  final int imageId;
  final String imageName;

  Image({required this.imageId, required this.imageName});

  factory Image.fromJson(Map<String, dynamic> parsedJson) {
    return Image(imageId: parsedJson['id'], imageName: parsedJson['imageName']);
  }
}
