class Property {
  final double width;
  final double breadth;

  Property({required this.width, required this.breadth});

// nested 구조
// 먼저 우리는 Property를 해결하고, 한 단계 위인 Shape class로 이동합니다.

  factory Property.fromJson(Map<String, dynamic> parsedJson) {
    return Property(width: parsedJson['width'], breadth: parsedJson['breadth']);
  }
}

class Shape {
  final String shape_name;
  final Property property;

  Shape({required this.shape_name, required this.property});

  factory Shape.fromJson(Map<String, dynamic> parsedJson) {
    return Shape(
        shape_name: parsedJson['shape_name'],
        property: Property.fromJson(parsedJson['property']));
  }
}
