import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/photo_model.dart';

Future<String> _loadPhotosAsset() async {
  return await rootBundle.loadString('assets/photo.json');
}

Future loadPhotos() async {
  String jsonString = await _loadPhotosAsset();
  final jsonResponse = json.decode(jsonString);
  PhotoList photos = PhotoList.fromJson(jsonResponse);
  print(photos.photos[0].id);
}
