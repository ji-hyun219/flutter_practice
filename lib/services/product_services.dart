import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/product_model.dart';

Future<String> _loadProductAsset() async {
  return await rootBundle.loadString('assets/product.json');
}

Future loadProduct() async {
  String jsonString = await _loadProductAsset();
  final jsonResponse = json.decode(jsonString);
  Product product = Product.fromJson(jsonResponse);
  print(product.id);
  print(product.name);
  print(product.images[0].imageName);
}
