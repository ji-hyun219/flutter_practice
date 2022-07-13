import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  final textStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<int>(
      stream: streamNumbers(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('StreamBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            Text(
              'connection state: ${snapshot.connectionState}',
              style: textStyle,
            ),
            Text('data: ${snapshot.data}'), // 캐싱 기능 장점
            Text('Error: ${snapshot.error}'),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('setState'),
            )
          ],
        );
      },
    ));
  }
}

Future<int> getNumber() async {
  await Future.delayed(const Duration(seconds: 3));

  final random = Random();

  return random.nextInt(100);
}

Stream<int> streamNumbers() async* {
  // waiting --> active --> done
  // active 상태에서 setState(= build) 하면 그래도 data 가 캐싱됨 == data 가 null 로 돌아가지 않음
  // 흐르는 걸 구독한다고 생각하면 된다.
  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));

    // if (i == 5) {
    //   throw Exception('에러 발생');
    // }

    yield i;
  }
}
