# flutter_practice

flutter 연습 공간

# flutter setting

1. development/flutter 에 sdk 설치
2. vi ~/.zshrc
3. export PATH="$PATH:$HOME/development/flutter/bin"
4. echo $HOME (HOME 환경변수 확인)
5. echo $PATH (PATH 환경변수 확인)
6. which flutter
7. sudo softwareupdate --install-rosetta --agree-to-license
8. IOS setup -> xcode 설치
9. Android setup -> android studio

# Flexible

The Flexible widget wraps a widget, so the widget becomes resizable.
When the Flexible widget wraps a widget, the widget becomes the Flexible widget’s child and is considered flexible.

- fit, flex, child 속성

# business_card 구현

참고: https://docs.flutter.dev/codelabs/layout-basics#putting-it-all-together

## 1. Icon 과 Text 정렬

```dart
     Row(
       children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle, size: 50),  // <--- child 삽입
        ),
        Column( ... ), // <--- The Column you first implemented
      ],
     );
```

- EdgeInsets 속성

  - EdgeInsets.all() : padding 값 일괄 적용
  - EdgeInsets.only() : left, right, top, bottom 의 padding 값을 선택 적용
  - EdgeInsets.symmetric() : horizontal(left, right), vertical (top, bottom)의 padding 값을 적용

- CrossAxisAlignment 속성
  - center 가 default 값
  - a Row's cross axis is vertical
  - a Column's cross axis is horizontal

## 2. 주소, 연락처 정렬

MainAxisSize.min 와 MainAxisAlignment 같이 사용할 시
적용이 되지 않았다.
MainAxisSize.min 을 해제해야 함

- 실무에서는 MainAxisSize.min 안씀(폰 기종마다 너비 값이 다르기 때문) -> padding 사용 권장!

## 3. Building Layouts

참고: https://docs.flutter.dev/development/ui/layout/tutorial

피드백 내용은 아래와 같습니다.

```dart
body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            const TitleWidget(),
            ButtonSection(),
            Container(
                child: Text(
                    'sjkfldjsflsjdflksdjflkdsjlfgkjsdlfjsdlkjfsdklfjlskadjflskaffsjflsdahfsdhafsdafssdfsdhflsdfhlsdifhsdldhflishlfi'))
          ])),
```

- 이렇게 먼저 padding 값을 주고 시작합니다.
- width 값은 되도록이면 사용하지 않습니다.

```dart
Widget build(BuildContext context) {
    return Container(
      // width: 280,
      child: Row(
        children: [
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Oeschinen Lake Campground'),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );
  }
}
```

- 주석 처리한 부분은 기존의 코드입니다.
- 주석 처리한 부분은 사용하지 말아야 할 코드입니다.

### Building Layouts final touch

- Column vs ListView
  - a ListView supports app body scrolling when the app is run on a small device.

# 반응형 flutter 앱 만들기

1. LayoutBuilder 클래스 사용
2. build functions 내에서 MediaQuery.of 메서드 사용

- Other useful widgets and classes for creating a responsive UI:
  - AspectRatio
  - CustomSingleChildLayout
  - CustomMultiChildLayout
  - FittedBox
  - FractionallySizedBox
  - LayoutBuilder
  - MediaQuery
  - MediaQueryData
  - OrientationBuilder

참고: https://docs.flutter.dev/development/ui/layout/adaptive-responsive

# Stack 위젯

위젯 리스트를 가지고 밑에서부터 형성

```dart
Stack(
  children: <Widget>[
    myGrayBox,
    myRedBox,
    Positioned(
      bottom: 0,
      right: 0,
      child: myGreenBox,
    ),
    myBlueBox,
    myYellowBox,
  ]
)
```

- Positioned 속성을 사용하면 Stack 내에서 특정 하위 요소에 특정 위치를 지정할 수 있습니다.

```dart
Stack(
  children: <Widget>[
    myGrayBox,
    Positioned(
      bottom: -50,
      right: -50,
      child: myBlueBox,,
    ),
  ],
  overflow: Overflow.visible,
)
```

- 가끔은 Stack 의 경계선 밖으로 하위 위젯을 밀어내기도 합니다.
- Overflow 속성을 이용해서 경계선을 벗어날지 말지를 설정해줄 수도 있습니다.

# ListView 위젯

```dart
ListView(
  children: [item1, item2, item3],
  scrollDirection: Axis.vertical,
  <!-- physics: NeverScrollableScrollPhysics(), -->
  <!-- addAutomaticKeepAlives: false, -->
  <!-- casheExtent: 100.0, -->
);
```

- addAutomaticKeepAlives: 동작 제어
- casheExtent: 화면 밖 수단 제어

```dart
ListView.builder(
  itemBuilder: (_, index) =>
    Text('Item $index'),
);
```

- ListView.builder: 쉽게 만들어지는 긴 항목 리스트나 동적으로 제작되는 항목 리스트 만들기
