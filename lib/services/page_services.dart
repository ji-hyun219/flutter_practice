import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/page_model.dart';

Future<String> _loadPageAsset() async {
  return await rootBundle.loadString('assets/page.json');
}

Future loadPage() async {
  String jsonString = await _loadPageAsset();
  final jsonResponse = json.decode(jsonString);
  Page page = Page.fromJson(jsonResponse);
  print(page.data);
}
