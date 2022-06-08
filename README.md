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

# Stateful Widget

종종 상위 위젯이 상태를 관리하고 하위 위젯에 업데이트 시기를 알리는 것이 가장 합리적이다.

해당 예에서는 TapboxB 는 콜백을 통해 해당 상태를 부모로 내보냅니다.
TapboxB 는 상태를 관리하지 않기 때문에 StatelessWidget 을 가집니다.

- 부모 위젯:

  - TapboxB 의 \_active state 를 관리
  - \_handleTapboxChanged() 상태를 탭할 때 호출되는 메서드를 구현
  - setState() 상태가 변경되면 UI 업데이트를 호출

- 자식 위젯(TapboxB):

  - 모든 상태가 부모에 의해 처리되기 때문에 StatelessWidget 을 확장
  - 탭이 감지되면 부모에게 알림

# Dart has two types of optional parameters:

1. named
2. positional

## 먼저, optional parameter 란 (named 와 positional 공통사항)

1. 호출자가 함수를 호출할 때 매개변수의 값을 지정할 필요가 없다는 점에서 선택사항
2. optional parameter 는 필수 매개변수 뒤에만 선언할 수 있다.
3. optional parameter 는 호출자가 값을 지정하지 않을 때 사용되는 기본값을 가질 수 있다.

## posional optional parameters

A parameter wrapped by [] is a `postional optional parameter`.

```dart
getHttpUrl(String server, String path, [int port=80]) {
  // ...
}
```

You can call getHttpUrl with or without the third parameter.

```dart
getHttpUrl('example.com', '/index.html', 8080); // port == 8080
getHttpUrl('example.com', '/index.html');       // port == 80
```

만약 아래와 같은 경우라면?

```dart
getHttpUrl(String server, String path, [int port=80, int numRetries=3]) {
  // ...
}
```

위의 optional parameter 들은 `positional` 이다.
왜냐하면 port 는 생략할 수 없기 때문이다.

## Named oprional parameters

A parameter wrapped by { } is a `named optional parameter`.

```dart
getHttpUrl(String server, String path, {int port = 80}) {
  // ...
}
```

getHttpUrl 함수를 호출할 때 third parameter 를 생략하거나 생략 없이 호출할 수 있다.
생략 없이 함수를 호출할 때는 아래와 같이 매개변수 이름을 사용해야 한다.

```dart
getHttpUrl('example.com', '/index.html', port: 8080); // port == 8080
getHttpUrl('example.com', '/index.html');             // port == 80
```

아래와 같이 함수에 대해 여러 명명된 매개변수를 지정할 수 있다.

```dart
getHttpUrl(String server, String path, {int port = 80, int numRetries = 3}) {
  // ...
}
```

다음과 같이 사용할 수 있다.

```dart
getHttpUrl('example.com', '/index.html');
getHttpUrl('example.com', '/index.html', port: 8080);
getHttpUrl('example.com', '/index.html', port: 8080, numRetries: 5);
getHttpUrl('example.com', '/index.html', numRetries: 5, port: 8080);
getHttpUrl('example.com', '/index.html', numRetries: 5);
```

## named parameter 와 positional parameter 를 같이 쓰고 싶다면?

```dart
void main() {
  int result = addNumbers(1, z: 2, y: 1);
  print(result);
}

int addNumbers(int x, {required int y, int z = 10}) {
  int sum = x + y + z;

  return sum;
}
```

# 부모, 자식 간의 위젯 상태관리

```dart
// 부모 위젯
Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

// 자식 위젯
class TapboxB extends StatelessWidget {
  const TapboxB({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }
```
