import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 목표: arguments 가 아닌 인자로 넘겨주기
// < 시나리오 정리 >
// 1-1. 포인트 사용 페이지 -> 보관함 페이지로 이동
// 1-2. 보관함 페이지에서 뒤로 가면 포인트 사용 페이지로 이동
// 2-1. 구매 페이지 -> 보관함 페이지로 이동
// 2-2. 보관함 페이지에서 뒤로 가면 구매 페이지로 이동

enum RoutingFrom {
  purchase,
}

class UsePointPage extends StatefulWidget {
  const UsePointPage({Key? key}) : super(key: key);

  @override
  State<UsePointPage> createState() => _UsePointPageState();
}

class _UsePointPageState extends State<UsePointPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('포인트 사용 페이지'),
        TextButton(
            onPressed: () async {
              Get.to(() => const GoodStorageWidget());
            },
            child: const Text('보관함으로 이동')),
      ],
    );
  }
}

class GoodStorageWidget extends StatefulWidget {
  final RoutingFrom? from;

  const GoodStorageWidget({Key? key, this.from}) : super(key: key);

  @override
  State<GoodStorageWidget> createState() => _GoodStorageWidgetState();
}

class _GoodStorageWidgetState extends State<GoodStorageWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (widget.from == RoutingFrom.purchase) {
            Get.offAll(const PurchaseWidget());
          } else {
            Get.back();
          }
        },
        child: const Text('뒤로 가기'));
  }
}

class PurchaseWidget extends StatelessWidget {
  const PurchaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('구매 페이지'),
        TextButton(
            onPressed: () async {
              Get.to(() => const GoodStorageWidget(from: RoutingFrom.purchase));
            },
            child: const Text('보관함으로 이동')),
      ],
    );
  }
}
