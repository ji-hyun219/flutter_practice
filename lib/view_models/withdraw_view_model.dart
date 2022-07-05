import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/models/wallet_model.dart';
import 'package:my_app/services/srt_service.dart';

class WithdrawViewModel extends GetxController {
  final inputController = TextEditingController();
  final inputValue = ''.obs;
  final isValidButton = false.obs;
  final walletList = <Wallet>[].obs;
  final isValidWallet = false.obs;
  final isLoading = false.obs;

  void getWalletList() {
    try {
      isLoading.value = true;
      final result = StakingService().getWalletList()["data"] as List;
      walletList.value = result.map((e) => Wallet.fromMap(e)).toList();
    } catch (e) {
      isValidWallet.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWalletList();

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
