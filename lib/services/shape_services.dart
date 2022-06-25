import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/shape_model.dart';

class ShapeService {
  Future<String> _loadShapeAsset() async {
    return await rootBundle.loadString('assets/shaped.json');
  }

  Future loadShape() async {
    String jsonString = await _loadShapeAsset();
    final jsonResponse = json.decode(jsonString);
    Shape shape = Shape.fromJson(jsonResponse);
    return shape;
    // print(shape.shape_name);
    // print(shape.property.width);
    // print(shape.property.breadth);
  }
}
