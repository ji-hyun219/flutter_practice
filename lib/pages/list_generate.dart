import 'package:flutter/material.dart';

// The base class for the different types of items the list can contain.
abstract class ListItem {
  // The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  // The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

// Missing concrete implementation of 'ListItem.buildTitle'.
// Try implementing the missing method, or make the class abstract.
  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headline5);
  }

// Missing concrete implementation of 'ListItem.buildSubtitle'.
// Try implementing the missing method, or make the class abstract.
  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();

  // SizedBox.shrink ()는 Container 또는 Material 과 달리 배경이나 장식이 전혀없는 위젯입니다.
  // 부모 제약 조건의 영향을 받지 않는 경우 가능한 가장 작은 영역으로 크기가 조정됩니다.
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

// 대부분의 경우 인터넷이나 로컬 데이터베이스에서 데이터를 가져와서 해당 테이터를 항목 목록으로 변환합니다.
// 이 예에서는 작업할 항목 목록을 생성합니다.
// 목록에서는 헤더와 5개의 메시지가 포함됩니다.
// 각 메시지에는 ListItem, HeadingItem, MessageItem 3가지 유형 중 하나가 있습니다.

// 데이터 소스를 위젯 목록으로 변환
// 각 항목을 위젯응로 변환하려면 ListView.builder() 생성자를 사용하십시오.
// 일반적으로 어떤 유형의 항목을 다루고 있는지 확인하고 해당 유형의 항목에 적절한 위젯을 반환하는 빌더 기능을 제공하십시오.

class ListGenerate extends StatelessWidget {
  final List<ListItem> items;

  const ListGenerate({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}
