import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/one_button_dialog.dart';
import 'package:firebase_core/firebase_core.dart';

class DynamicLink extends StatefulWidget {
  const DynamicLink({Key? key}) : super(key: key);

  @override
  State<DynamicLink> createState() => _DynamicLinkState();
}

class _DynamicLinkState extends State<DynamicLink> {
  // screenName 파라미터로 LbNr 전달하기

  Future<String> _createDynamicLink(String screenName) async {
    String dynamicLinkPrefix = 'https://ix219naver.page.link';

    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      // uriPrefix: Firebase 콘솔에서 찾을 수 있는 앱 고유 링크이다.
      // Firebase 콘솔 > 동적 링크 로 이동하면 https://... 과 같은 링크가 표시된다.
      // 이것이 바로 uriPrefix 이다.
      link: Uri.parse('$dynamicLinkPrefix/$screenName'),
      // link: 도메인을 통해 특정 컨텐츠에 접근하기 위한 URL 을 설정하면 된다.
      // 예시
      // link: Uri.parse('$dynamicLinkPrefix/$screenName?id=$id'),
      // 1. 스크린 이름을 하위 path 로 설정
      // 2. 각각의 id 별로 다른 화면을 보여주기 위하여 id란 이름의 쿼리 파라미터를 설정
      androidParameters: const AndroidParameters(
        packageName: 'com.example.my_app',
        minimumVersion: 0,
        // 링크를 열 수 있는 앱의 최소 버전
        // -> 만약 앱이 설치되어있는데 minimumVersion 보다 낮으면 앱을 안열고 플레이스토어로 이동시켜서 업데이트를 유도
      ),
      // iosParameters: const IOSParameters(
      //   bundleId: packageName,
      //   minimumVersion: '0',
      // ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  void _copy() async {
    try {
      var url = await _createDynamicLink('LbNr');
      Clipboard.setData(ClipboardData(text: url));
      Get.dialog(
          const OneButtonDialog(title: '알림', content: '공유 링크 복사가 완료되었습니다'));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          child: ElevatedButton(
            onPressed: _copy,
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text('링크 복사하기'),
          ),
        ),
      ),
    );
  }
}
