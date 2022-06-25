import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/address_model.dart';

Future<String> _loadAddressAsset() async {
  return await rootBundle.loadString('assets/address.json');
}

Future loadAddress() async {
  String jsonString = await _loadAddressAsset();
  final jsonResponse = json.decode(jsonString);
  Address address = Address.fromJson(jsonResponse);
  print(address.city);
  print(address.streets);
}
