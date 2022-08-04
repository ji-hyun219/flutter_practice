import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class GetMyDeviceInfo extends StatefulWidget {
  const GetMyDeviceInfo({Key? key}) : super(key: key);

  @override
  State<GetMyDeviceInfo> createState() => _GetMyDeviceInfoState();
}

class _GetMyDeviceInfoState extends State<GetMyDeviceInfo> {
  @override
  Widget build(BuildContext context) {
    print('현재 OS 알아내기:: ${Platform.operatingSystem}'); // android

    return Scaffold(
      appBar: AppBar(title: const Text('현재 디바이스 OS')),
      body: Center(
        child: Text(Platform.isAndroid ? '안드로이드 기기' : '아이폰 기기'),
      ),
    );
  }
}
