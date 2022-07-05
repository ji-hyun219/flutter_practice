import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view_models/withdraw_view_model.dart';
import 'package:my_app/models/wallet_model.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({
    key,
    required this.walletItem,
  }) : super(key: key);

  final Wallet walletItem;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final _viewModel = Get.put(WithdrawViewModel());
  int? selectedWallet;

  void onChange(int id) {
    setState(() {
      selectedWallet = id;
    });
    // print(id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onChange(widget.walletItem.id), Get.back()},
      child: Column(children: [
        const Text('sdfsf'),
        Text('${widget.walletItem.id}'),
        Text(widget.walletItem.walletAddress),
        Text(widget.walletItem.withdrawAt),
      ]),
    );
  }
}
