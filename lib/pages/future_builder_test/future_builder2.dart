import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderPage2 extends StatefulWidget {
  const FutureBuilderPage2({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage2> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage2> {
  final textStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getNumber(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // 한 번도 데이터 요청을 안했을 때
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // 아래는 유저 입장에서 추천x
        // 혹은 일부 화면 circularProgressIndicator 사용할 때 적합
        // 예를 들어, 페북도 위에서 땡기면 전체 로딩이 표시되지 않고 위에만 표시되듯이!
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
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
