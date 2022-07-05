import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/wallet_page.dart';
import 'package:my_app/view_models/withdraw_view_model.dart';

class SrtWithdraw extends StatefulWidget {
  const SrtWithdraw({Key? key}) : super(key: key);

  @override
  State<SrtWithdraw> createState() => _SrtWithdrawState();
}

class _SrtWithdrawState extends State<SrtWithdraw> {
  final _viewModel = Get.put(WithdrawViewModel());

  void onClick() {
    setState(() {
      _viewModel.inputController.text = '주소 입력';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _viewModel.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Container(
              child: Column(
                children: [
                  TextField(
                    controller: _viewModel.inputController,
                    decoration: InputDecoration(
                        suffixIcon: Text('주소',
                            style: TextStyle(
                                color: _viewModel.inputValue.value == ""
                                    ? Colors.grey
                                    : Colors.blue))),
                  ),
                  ElevatedButton(onPressed: onClick, child: const Text('버튼')),
                  TextButton(
                    onPressed:
                        _viewModel.isValidButton.value == true ? () {} : null,
                    child: const Text('활성화 테스트'),
                  ),
                  ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('전자 지갑 주소록'),
                              content: Column(
                                  children: _viewModel.walletList
                                      .map<Widget>((element) => WalletPage(
                                            walletItem: element,
                                          ))
                                      .toList()),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: const Text('닫기'))
                              ],
                            )),
                    child: const Text('지갑 주소록'),
                  )
                ],
              ),
            ),
    );
  }
}
