import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put()을 사용하여 클래스를 인스턴스화하여 거기에 있는 모든 "child" 경로에서 사용할 수 있도록 합니다.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: Obx(() => Text('Clicks: ${c.count.value}')),
      ),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: ElevatedButton(
            child: Text('Go to Other'), onPressed: () => Get.to(Other())),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('${c.count}')));
  }
}


// Getx 의 상태 값을 사용하기 위해서는 Get.put 을 이용하여 컨트롤러를 생성하여 사용했습니다.
// 만약, 자식 위젯에서 해당 컨트롤러를 사용하여 상태 값을 변경하거나, 상태 값을 사용해야 하는 경우는 어떻게 해야할까요?
// 물론 다음과 같이 생성한 컨트롤러를 파라메터로 전달할 수 있습니다.
// CustomWidget(controller: controller)

// 하지만 GetX 에서는 Get.find 를 제공하여 다음과 같이 좀 더 쉽게 생성된 컨트롤러에 접근할 수 있도록 하고 있습니다.
// Get.find<CountController>()

