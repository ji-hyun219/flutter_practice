import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawViewModel extends GetxController {
  final inputController = TextEditingController();
  final inputValue = ''.obs;
  final isValidButton = false.obs;

  @override
  void onInit() {
    super.onInit();

    inputController.addListener(() {
      inputValue.value = inputController.text;

      if (inputValue.value.length >= 2) {
        isValidButton.value = true;
      } else {
        isValidButton.value = false;
      }
    });
  }
}
