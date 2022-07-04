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

# Building Layouts final touch

- Column vs ListView
  - a ListView supports app body scrolling when the app is run on a small device.

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

# Navigator

https://api.flutter.dev/flutter/widgets/Navigator-class.html

- 스택 규칙을 사용하여 하위 위젯 세트를 관리하는 위젯입니다.
- 네비게이터는 `Route` 객체 스택을 관리하고 스택 관리를 위한 두가지 방법인 선언적 API `Navigator.pages` 또는
  명령적 API `Navigator.push` 및 `Navigator.pop` 을 제공합니다.
- Android와 같은 특정 플랫폼에서 시스템 UI는 사용자가 애플리케이션 스택의 이전 경로로 다시 이동할 수 있도록 하는 뒤로 버튼(애플리케이션 범위 밖)을 제공합니다. 이 기본 제공 탐색 메커니즘이 없는 플랫폼에서 AppBar (일반적으로 Scaffold.appBar 속성에서 사용됨)를 사용하면 사용자 탐색을 위한 뒤로 버튼을 자동으로 추가할 수 있습니다.

## 1. Displaying a full-screen route

- `MaterialApp 의 home` 은 `Navigator 스택의 맨 아래에 있는 경로`가 됩니다.
- 스택의 새 경로를 푸시하려면 화면에 표시하려는 모든 것을 생성하는 빌더 함수로 `MaterialPageRoute` 의 인스턴스를
  생성할 수 있습니다.
- 라우트는 푸시 및 팝업 시점에 따라 다른 context 에서 빌드 및 재빌드되기 때문에 하위 위젯 대신 `builder function`을 사용하여 위젯을 정의합니다.
- 아래와 같이 새 경로가 팝업되어 Navigator 의 pop 메서드를 사용하여 앱의 홈 페이지가 표시됩니다.

```dart
Navigator.pop(context);
```

- Scaffold 는 AppBar 에 '뒤로' 버튼을 자동으로 추가하기 때문에 일반적으로 Scaffold 가 있는 경로의 네이게이터를 표시하는 위젯을 제공할 필요가 없습니다.
- `뒤로 버튼을 누르면 Navigator.pop 이 호출`됩니다.
- Android 에서는 시스템 '뒤로 버튼'을 눌러도 동일한 작업을 수행합니다.

## 2. Using named navigator routes

- MaterialApp 은 경로 이름에서 경로를 생성할 빌더 함수로 매핑하는 Map<String, WidgetBuilder> 로 생성할 수 있습니다.
- named 방식으로 경로를 표시하려면:

```dart
Navigator.pushNamed(context, '/b');
```

## 경로는 값을 반환할 수 있습니다

- 사용자에게 값을 요청하기 위해 경로가 푸시되면 pop 메서드의 결과를 통해 값(여기선 true)을 반환할 수 있습니다.
- 경로를 푸시하는 메서드는 Future 를 반환합니다.(await 사용 이유)
- Future 는 경로가 팝업되고 Future 의 값이 pop 메소드의 result 매개변수일 때 확인됩니다.

```dart
bool value = await Navigator.push(context, MaterialPageRoute<bool>(
  builder: (BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('OK'),
        onTap: () { Navigator.pop(context, true); }
      ),
    );
  }
));
```

- 사용자가 '확인'을 누르면 값이 true 가 됩니다.
- 뒤로 버튼을 눌러 경로를 벗어나면 값이 null 이 됩니다.

## 팝업 경로

- `경로가 전체 화면을 가리지 않아도 됩니다.`
- `PopupRoute` 는 현재 화면이 통과할 수 있도록 부분적으로만 불투명할 수 있는 `ModalRoute.barrierColor` 로 화면을 덮습니다.
- 팝업 경로는 아래 위젯에 대한 입력을 차단하기 때문에 `모달`입니다.
- 팝업 경로를 생성하고 보여주는 기능이 있습니다. (예: showDialog, showMenu, showModalBottomSheet)
- `PopupMenuButton` 및 `DropdownButton` 과 같이 팝업 경로를 생성하는 위젯도 있습니다. 이러한 위젯은 PopupRoute 의 내부 하위 클래스를 만들고 `Navigator 의 push, pop 메서드`를 사용하여 표시 및 해제합니다.

# GetX

참고: https://sudarlife.tistory.com/entry/%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC%EC%9D%98-%EB%81%9D%ED%8C%90%EC%99%95-GetX%EB%A5%BC-%EC%A0%95%EB%A6%AC%ED%95%B4-%EB%B3%B4%EC%95%98%EB%8B%A4

# JSON 과 직렬화

https://flutter-ko.dev/docs/development/data-and-backend/json#manual-encoding

일반 JSON 디코딩은 `dart:convert` 에 탑재되어 있는 JSON 디코더를 사용하는 것을 가리킵니다.
JSON 문자열을 `jsonDecode()` 함수에 전달한 후, 결괏값 `Map<String, dynamic>` 에서 필요한 값을 참고하면 됩니다.

```dart
Map<String, dynamic> user = jsonDecode(jsonString);

print('안녕하세요, ${user['name']}님!');
print('${user['email']}으로 인증 링크를 보냈습니다.');
```

안타깝게도, jsonDecode()는 `Map<String, dynamic>`을 돌려주어, 런타임 이전까지는 값의 자료형을 알 수 없게 됩니다. 이런 접근 방식을 사용하면, 정적 타입 언어의 기능인 타입 안전성, 자동완성, 그리고 가장 중요한 컴파일 타임 오류를 사용할 수 없게 됩니다. 이로 인해 코드는 순식간에 오류가 발생하기 쉬운 환경에 처하게 됩니다.

## 모델 클래스와 JSON 직렬화

- map 구조에서 새로운 User 객체를 생성하기 위한 생성자인 User.fromJson() 생성자
- User 객체를 map 구조로 변환하기 위한 메서드인 toJson() 메서드

user_model.dart

```dart
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'email': email,
    };
}
```

디코딩 로직의 책임이 이제 모델 내부로 옮겨졌기에, 아래의 새로운 방법으로 유저를 쉽게 디코드할 수 있습니다.

```dart
Map userMap = jsonDecode(jsonString);
var user = User.fromJson(userMap);

print('안녕하세요, ${user.name}님!');
print('${user.email}으로 인증 링크를 보냈습니다.');
```

# Flutter 의 Widget 에서 앱 활성화 여부 파악하기

앱이 활성화될 때, 즉 백그라운드 상태에서 포그라운드 상태로 앱이 다시 올라왔을 때
위젯이 이 상태를 직접 파악하는 방법은 기존적으로 제공되지 않습니다.

- WidgetsBindings 의 observer 기능

1. State 를 구현하는 예제이기 때문에 `initState` 와 `dispose` 를 통해
   위젯이 생성되거나 사라지는 시점을 알 수 있으니 이를 이용해 `observer` 를
   등록하거나 제거할 수 있습니다.

2. `observer` 를 통해 앱의 상태가 변화되면 `didChangeAppLifecycleState` 가 호출됩니다.

# super constructor

```dart
void main(){
  var dog1 = Dog("Labrador", "Black");
}

class Animal {
  String color;

  Animal(String color) {
    this.color = color;
    print('Animal class constructor');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String breed, String color) : super(color){
    this.breed = breed;
    print('Dog class constructor');
  }
}

```

# initState

State 의 하위 클래스는 한 번만 발생해야 하는 작업을 수행하기 위해
initState 를 재정의할 수 있습니다.
예를 들어 애니메이션을 구성하거나 플랫폼 서비스를 구독하려면
initState 를 재정의합니다.
initState 의 구현은 super.initState 를 호출하여
필요합니다.

상태 객체가 더 이상 필요하지 않으면 프레임워크는 상태 객체에 대해 dispose()를 호출합니다. 정리 작업을 수행하려면 dispose 함수를 재정의하십시오. 예를 들어 타이머를 취소하거나 플랫폼 서비스 구독을 취소하려면 dispose를 재정의합니다. dispose 구현은 일반적으로 super.dispose를 호출하여 종료됩니다.

# StatefulWidget

StatefulWidget 인스턴스는 mutable 하지 않다. StatefulWidget 인스턴스 자체는 immutable 하지만, mutable한 상태(state)를 별도로 관리한다. 상태(state)가 저장되는 곳은 State 오브젝트이며, State 오브젝트는 createState() 메소드를 통해 생성된다.

```dart
class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget Example'),
      ),
      body: Center(
        child: Text(
          '현재 숫자: $_counter',
        ),
      ),
    );
  }
```

# 위젯 빌드 완료 시 메서드 실행

1. 위젯바인딩

```dart
WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
    });
```

2. 스케줄러바인딩

```dart
SchedulerBinding.instance.addPostFrameCallback((_) {
  print("SchedulerBinding");
});
```

내부 initState에서 호출할 수 있으며, 위젯 빌드가 렌더링을 완료한 후 둘 다 한 번만 호출됩니다.

# The instance member '...' can't be accessed in an initializer.

- 플러터로 개발하면서 자주 마주치는 에러
- `class 내에서 initializer 선언하고 이를 접근할 때 발생하는 에러`이다

즉, initState() 내의 변수에 호출된 함수의 값을 받아오더라도 변수에 대한 실제 사용을 위한
어떤 행동이나 다른 변수에 값을 넣는 등의 행위는 위처럼 `build() 내`에서 하여야 한다.

```dart
class _MyGameState extends State<MyGame> {
  int _numberOfTeams = 4;

  List<int> _teamPoints = List.filled(_numberOfTeams, 0);
}
```

메소드가 아닌 객체 내부에 있기 때문에 속성이 아직 초기화되지 않았을 수 있으므로 생성할 다른
속성 \_numberOfTeams, \_teamPoints 에 의존할 수 없습니다.

### 해결 방법

1. 속성을 static 으로 만들기
   종속 값을 정적으로 만듭니다

```dart
static int _numverOfTeams = 4;
```

2. 클래스 내부에서 초기화 목록을 사용할 수 있는 경우

```dart
class TeamList {
  int _numberOfTeams;
  List<int> _teamPoints;

  TeamList(
    this._numberOfTeams,
  ) : _teamPoints = List.filled(_numberOfTeams, 0);
}

```

3. State 내부에서 initState override 하는 경우

```dart
class _HomeState extends State<Home> {
  int _numberOfTeams = 4;

  late List<int> _teamPoints;

  @override
  void initState() {
    super.initState();
    _teamPoints = List.filled(_numberOfTeams, 0)
  }
}
```

여전히 객체 내부 상태의 인스턴스이기 때문에 2 또는 3을 추천합니다.
생성을 약간 미루면 됩니다.
https://dart.dev/tools/diagnostic-messages#implicit_this_reference_in_initializer

# Late Error

### LateInitializationError

```dart
class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  late String name, email;
  Widget currentWidget = BackgroundBetcher();

  @override
  void initState() {
    super.initState();
    findNameAnEmail();
  }

  Future<Null> findNameAnEmail() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event!.displayName!;
          email = event.email!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
      ),
```

- name 필드가 초기화되지 않았습니다.
- 이 에러가 나는 이유는 findNameAnEmail 는 비동기식 메서드이므로 initState 에서 호출되는 동안 Flutter 는 완료되는 것을 기다리지 않습니다. (build 가 불리기 전에)
- findNameAnEmail is an asynchronous method, so, while it's called in initState, Flutter does not wait for it to complete before build is called.
- 그 결과, late 필드가 설정되기 전에 엑세스됩니다.
- `빌드하기 전에 Future 완료될 때까지 기다리려면 FutureBuilder` 를 사용할 것

# FutureBuilder

- 데이터를 다 받기 전에 먼저 데이터가 없이 그릴 수 없는 부분을 먼저 그려주기 위해 사용이 되는 것.
- 만약 FutureBuilder 가 없다면 데이터가 다 받아지기를 기다린 후 화면을 그리거나 데이터가 변함을 setState() 를 통해 바꾸어 주어야 할 것

### connectionState

- connectionState.none
- connectionState.waiting
- connectionState.active
- connectionState.done
