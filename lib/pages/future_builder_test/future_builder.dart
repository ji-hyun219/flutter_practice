import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  final textStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getNumber(), // 2. Future 추가
      builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('FutureBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            Text(
              'connection state: ${snapshot.connectionState}',
              // 1. Future 가 아예 없으면 none 이 나온다.
              // 3. waiting --> done
              // 즉 snapshot 데이터가 바뀌면 자동으로 실행
              style: textStyle,
            ),
            Text('data: ${snapshot.data}'),
            Text('Error: ${snapshot.error}'),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                // setState 를 실행하면 다시 build 되지만
                // 그래서 connctionState 도 waiting --> done 이 되고
                // 그런데 데이터는 기존의 데이터가 그려진 후 바뀐다 : 캐싱
                // 기존의 데이터를 기억
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
