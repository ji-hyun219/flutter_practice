# flutter_practice

flutter 연습 공간

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

# showDialog

```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text("Alert Dialog title"),
      content: new Text("Alert Dialog body"),
      actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
    )
  },
  barrierDismissible: false, // 여백을 눌러도 닫히지 않기
);
```

# The argument type 'List<dynamic>' can't be assigned to the parameter type 'List<Widget>'

```dart
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(title: const Text('DeliMeals')),
  body: GridView(
    children: DUMMY_CATEGORIES
        .map((categoryData) => CategoryItem(   //getting
              categoryData.title,             //the error
              categoryData.color,            //here
            ))
        .toList(),
```

위와 같은 코드는 에러가 난다.
다음과 같이 해결하면 좋다.

specify the type of the map `map<Widget>`

```dart
DUMMY_CATEGORIES
        .map<Widget>((categoryData) => CategoryItem(
              categoryData.title,
              categoryData.color,
            ))
        .toList(),
```

# 딥링크

./android/app/src/main/AndroidManifest.xml에서 `kakao{카카오 네이티브 앱키}`가 `Scheme`이 되고, `kakaolink`가 `Path`가 된다. Scheme은 카카오 자체에서 URI 스킴이 겹치지 않게 랜덤으로 배정해주므로 중복될 걱정이 없다. 만약, 카카오 링크 없이 딥링크만을 원하면 아래의 `<data ~ />`에 원하는 값들을 집어넣으면 된다.

# 핫리로드

앱을 처음부터 다시 시작하지 않고 새로운 코드 변경에 따른 코드 변경 사항만 표시하며 변경된 코드에만 적용한다.
Flutter 의 핫 리로드 기능은 개발자가 빠르고 간단하게 테스트하고, UI를 빌드하고, 버그를 고치는 것에 도움을 준다.

- 핫 리로드는 가상 머신에 변경된 코드를 불러오고 위젯 트리를 재빌드한다.
- 이때 앱의 상태를 보존하기 때문에 main() 이나 initState() 를 재실행하지 않는다.

### 핫 리로드가 적용되지 않는 예외

- 앱이 죽으면 핫 리로드를 사용할 수 없다.

# Deep Link 와 Dynamic Links 의 개념 및 차이점

## Deep Link

Deep Link 는 앱에서만 쓰이는 단어가 아니며 웹도 함께 포함한다.
하지만 일반적으로 앱에서 Deep Link 란 용어를 많이 사용하며, 해당 용어는 일반적으로 검색 가능하거나 특정 웹 컨텐츠로 연결된 하이퍼링크를 사용하는 것이다.
즉, 특정 컨텐츠로 연결된 하이퍼링크를 의미한다.

## Dynamic Links

Dynamic Links 는 `Firebase 에서 제공되는 서비스`로 이것이 Deep Link 를 의미하지 않는다.
어디까지나 Deep Link 를 포함하는 개념으로 보다 포괄적인 상황을 다루고 있다.

동적 링크는 `앱 설치 여부에 관계 없이 앱으로 연결되는 딥링크`이다.

### 동적 링크 매개변수

- link: 앱에서 열리는 링크입니다. 앱이 처리할 수 있는 URL(일반적으로 앱의 콘텐츠 또는 페이로드)을 지정할 수 있으며, 이를 통해 사용자에게 쿠폰을 지급하거나 시작 화면을 표시하는 등 앱의 특정 로직을 시작할 수 있습니다. 이 링크는 올바른 형식의 URL이어야 하며, 적절한 URL 인코딩을 적용해야 합니다. HTTP 또는 HTTPS를 사용해야 하며 다른 동적 링크가 아니어야 합니다.

# 앱 번들

app bundle 은 말 그대로 app 묶음입니다.

이전에는 앱은 "하나의 apk 파일로 압축되어 배포된다" 의 개념이었다면 app bundle 은 "여러 개의 분할된 apk 가 필요에 따라 구성되어 하나의 앱으로 동작한다"의 개념입니다.

따라서 앱이 동작함에 있어 필요한 전체 구성요소들을 하나로 묶어서 배포하며, 실제 apk 가 Google play 를 통해 설치될 때, 전체 구성요소 중 해당 단말에 최적화된 구성으로만 정리하여
앱이 설치됩니다.

# 파이어베이스 설치

Flutter 에서 Firebase 와 관련된 서비스들을 이용하기 위해선 몇가지 설정이 필요한데 과거엔 매우 복잡했으나 발전을 거듭하여 CLI 이용하여 커맨드에 따라 실행하면 완료되도록 이와 관련된 설정이 매우 편해졌다.

다음 공식 문서 참고
https://firebase.google.com/docs/cli#setup_update_cli

1. 자동 설치 스크립트를 사용하여 Firebase CLI 를 설치하려면 다음 단계를 따르세요

- curl -sL https://firebase.tools | bash
  이 스크립트는 운영체제를 자동으로 감지하고 최신 Firebase CLI 릴리스를 다운로드한 다음 디렉터리에 관계없이 사용 가능한 firebase 명령어를 사용 설정합니다.
- firebase 명령어가 활성화되는 것을 볼 수 있었다.

2. 계속해서 로그인하여 CLI 를 테스트합니다

- firebase login
- 이 명령어는 로컬 머신을 Firebase 에 연결하고 Firebase 프로젝트에 대한 액세스 권한을 부여합니다.

3. Allow Firebase to collect CLI usage and error reporting information?

- Y 를 누르면 새로운 창이 뜨며 로그인을 하면 된다.

4. Firebase 프로젝트를 나열하여 CLI 가 올바르게 설치되었고 사용자 계정에 액세스하는지 테스트 합니다. 다음 명령어를 실행합니다.

- firebase projects:list

4. Firebase CLI Login Successful!

# 짧은 Dynamic Links 생성

```dart
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<String> getShortLink(String screenName, String id) async {
  String dynamicLinkPrefix = 'https://example.app/share';
  final dynamicLinkParams = DynamicLinkParameters(
    uriPrefix: dynamicLinkPrefix, // uriPrefix: 설정한 도메인에 해당
    link: Uri.parse('$dynamicLinkPrefix/$screenName?id=$id'),
    // link: 도메인을 통해 특정 컨텐츠에 접근하기 위한 URL 을 설정하면 된다.
    // 예시
    // link: Uri.parse('$dynamicLinkPrefix/$screenName?id=$id'),
    // 1. 스크린 이름을 하위 path 로 설정
    // 2. 각각의 id 별로 다른 화면을 보여주기 위하여 id란 이름의 쿼리 파라미터를 설정
    androidParameters: const AndroidParameters(
      packageName: packageName,
      minimumVersion: 0,
    ),
    iosParameters: const IOSParameters(
      bundleId: packageName,
      minimumVersion: '0',
    ),
  );
  final dynamicLink =
      await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

  return dynamicLink.shortUrl.toString();
}
```

그 후 생성된 링크를 공유할 시, 아래 라이브러리의 도움을 받아 손쉽게 목적을 달성할 수 있다.
-> `flutter pub add share_plus`

# No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()

2020년 8월 17일부터 시작
모든 Firebase 버전이 업데이트되었으며 이제 Firebase 제품을 사용하기 전에 다음과 같이 호출해야 합니다.
`Firebase.initializeApp()`

먼저 모든 firebase 제품은 이제 `firebase_core 버전(0.5.0 이상)`에 종속되므로 `pubspec.yaml 파일에 추가`해야 합니다.
`firebase_core : ^0.5.0`

## 첫번째 예

```dart
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
```

## 두번째 예

initState() 에서 초기화한 후 setState() 를 호출. 이것은 build 메서드를 호출할 것이다.

```dart
@override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
```

## 세번째 예

WidgetsFlutterBinding.ensureInitialized() 를 부른 후 main() 메서드 안에서 초기화해라

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

모든 예시에서 알아두어야 할 것은 `you only have to call initializeApp() once`

# 로티

lottie 를 이용하기 위해서는 StatefulWidget 이어야 합니다.
stateless 도 가능하지만 애니메이션 컨트롤을 위함입니다.

## 간단한 애니메이션

- 이 예제는 가장 간단한 방법으로 Lottie 애니메이션을 표시하는 방법을 보여줍니다.
- 위젯은 Lottie json 파일을 로드하고 애니메이션을 무기한 실행합니다.

```dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/LottieLogo1.json'),

            // Load a Lottie file from a remote url
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

            // Load an animation and its images from a zip file
            Lottie.asset('assets/lottiefiles/angel.zip'),
          ],
        ),
      ),
    );
  }
}
```

## 사용자 지정 AnimationController

- 사용자 지정 AnimationController 을 사용하면 다양한 방식으로 애니메이션을 재생할 수 있는 풍부한 API 가 있습니다.
  원할 때 애니메이션 시작 및 중지, 앞으로 또는 뒤로 재생, 특정 지점 간 반복...
- 티커는 플러터가 특별히 제공하는 기능으로, 티커는 애니메이션이 진행되는 동안 내부 로직을 담당한다.
- `매 프레임마다 객체에 알림을 줄 때 티커를 사용`한다.
- 플러터는 초당 60프레임을 그린다.
- 티커는 이름에서도 알 수 있듯이 티커는 매 프레임을 시계의 초침처럼 '틱' 으로 사용한다는 사실만 이해하면 쉽다.
- `TikerProvider 클래스`는 이름에서도 알 수 있듯이 위젯에 티커를 제공하며, 이를 이용하면 직접 티커를 다루지 않아도 된다.
- StatefulWidget 에서 State 클래스를 상속 받으며 with 로 TickerProviderStateMixin 을 가져오는 방법으로 TickerProvider 를 사용한다.
- 이렇게 상태를 갖는 위젯은 `매 프레임마다 알림을 받을 수 있다`.

### AnimationController

- 애니메이션을 사용하려면 AnimationController 객체가 필요하다.
- AnimationController 객체는 이름에서도 알 수 있듯이 애니메이션을 제어
- AnimationController 객체는 Ticker 객체를 알고 있으므로 티커로 생기를 불어넣고 새 프레임 또는 틱이 발생할 때마다 `컨트롤러에 이를 알린다`.

- 애니메이션 컨트롤러는 애니메이션을 적용할 위젯을 알고 있으며 위젯에서 설정한 트윈값, 곡선값에 따라 `틱이 발생할 때마다 필요한 값을 계산하고 애니메이션을 진행`
- AnimationController 클래스는 `애니메이션을 시작, 정지, 재설정, 반대로 재생, 무한 반복 등의 기능을 수행하는 메서드를 제공`
- AnimationController 를 만드려면 `티커`와 `애니메이션 길이`(시작값과 끝값을 얼마의 시간 동안 진행해야 하는지) `두 가지 인수가 필요`
- State 객체는 TickerProviderStateMixin 을 상속 받으므로 위젯 자체가 티커이다.

# 전환되는 페이지로부터 데이터 받기

두번째 페이지에서 첫번째 페이지로 데이터 전달

```dart
var value = await Get.to(SecondPage());

// 그리고 두번째 페이지에서 데이터를 전달
Get.back(result: value)
```

# widget 객체

https://stackoverflow.com/questions/50428708/pass-statefulwidget-data-to-the-state-class-without-using-constructor

GoodStorageWidget get widget
package:flutter/src/widgets/framework.dart

The current configuration.

A [State] object's configuration is the corresponding [StatefulWidget] instance. This property is initialized by the framework before calling [initState]. If the parent updates this location in the tree to a new widget with the same [runtimeType] and [Widget.key] as the current configuration, the framework will update this property to refer to the new widget and then call [didUpdateWidget], passing the old configuration as an argument.

[State] 개체의 구성은 해당 [StatefulWidget] 인스턴스입니다. 이 속성은 [initState]를 호출하기 전에 프레임워크에 의해 초기화됩니다. 부모가 현재 구성과 동일한 [runtimeType] 및 [Widget.key]를 가진 새 위젯으로 트리의 이 위치를 업데이트하면 프레임워크는 이 속성을 업데이트하여 새 위젯을 참조한 다음 [didUpdateWidget]을 호출하여 전달합니다. 이전 구성을 인수로 사용합니다.

# 새로운 화면으로 데이터 보내기

새로운 화면으로 단순히 이동하는 것뿐만 아니라 데이터를 넘겨주어야 할 때가 있습니다.
아래와 같은 단계로 진행합니다.

1. Todo 클래스를 정의합니다.
2. Todo 리스트를 보여줍니다.
3. Todo 에 대한 상세 정보를 보여줄 수 있는 화면을 생성합니다.
4. 상세 화면으로 이동하면서 데이터를 전달합니다.

# ? 관련 연산자

??= : 변수가 현재 널인 경우에만 변수에 값 지정
?? : 왼쪽 표현식 값이 널이 아니면 왼쪽 표현식을, 널이면 오른쪽 표현식 리턴
?. : null 이면 null 값 출력

```dart
 _homeViewModel.user?.referralCode ?? '',
```

# FutureBuilder 가 여러 번 호출되는 것을 방지

```dart
 class Pagina3State extends State<Pagina3> {
   late final Future myFuture = getDataArray();

   @override
   Widget build(BuildContext context) {
       child: FutureBuilder(
              future: myFuture,
      )
   }
}
```

# 플러터의 빌드 모드

언제 어떤 모드를 사용해야 하는지 간략하게 요약

- 개발하면서 hot reload 를 사용하고 싶다면, 디버그 모드를 사용하세요.
- 성능을 분석하고 싶다면, 프로파일 모드를 사용하세요.
- 앱을 출시할 준비가 됐다면, 릴리즈 모드를 사용하세요.

### 디버그 모드

디버그 모드에서는 물리적 기기 혹은 애뮬레이터, 시뮬레이터에서 앱이 디버깅할 수 있는 상태로 준비됩니다.
기본적으로 flutter run 은 디버그 모드로 컴파일합니다.
`flutter run`: VSCode 가 아닌 터미널을 사용해서 실행하는 명령. `flutter run`을 사용하면 Flutter 의 Hot Reloading 기능이 정상적으로 동작하지 않아 VSCode 의 Debugging 기능을 사용하여 프로젝트를 실행

### 릴리즈 모드

최대한 최적화하고 앱의 사이즈를 가장 작게 하기를 원한다면, 앱을 배포할 때 릴리즈 모드를 사용하세요.
모바일의 경우 릴리즈 모드는 (시뮬레이터와 애뮬레이터에서 지원되지 않습니다) 아래와 같은 의미가 있습니다.

- Assertions이 불가능합니다.
- 디버깅 정보는 제거됩니다.
- 디버깅이 불가능합니다.
- 빠른 시작, 빠른 실행, 작은 앱 사이즈에 최적화하여 컴파일 합니다.
- 서비스 익스텐션을 사용할 수 없습니다.

`flutter run --release` 명령은 릴리즈 모드로 컴파일합니다.
`flutter build <target>` 명령어를 사용하여 특정 모드로 컴파일할 수 있습니다.
`flutter help build` 로 지원되는 target 목록을 확인하실 수 있습니다.

### 프로파일 모드

프로파일 모드 에서는 앱의 성능을 측정할만한 일부 디버깅 기능이 유지됩니다.
에뮬레이터나 시뮬레이터는 실제 성능을 표현할 수 없기 때문에 프로파일 모드를 사용할 수 없습니다.
모바일에서 프로파일 모드는 아래 차이를 제외하면 릴리즈 모드와 유사합니다:

1. 일부 서비스 익스텐션(performance overlay 지원 등)이 활성화됩니다.
2. 추적이 활성화되고, (DevTools 같은) 소스 레벨의 디버깅을 지원하는 툴을 연결하여 작업할 수 있습니다

# 안드로이드 앱 출시 준비하기

Flutter 앱 개발하는 동안, 커맨드 라인에서의 flutter run 을 실행하거나 IDE 의 툴바 Run 과 Debug 를 선택하여 앱을 테스트할 수 있습니다.
Flutter 는 기본적으로 `앱의 debug 버전을 빌드`합니다.

앱의 release 버전을 출시 전, `마지막 작업들`에 대해서 알아보자.

### 앱 서명하기

Google Play 스토어에 출시하기 위해서는 반드시 앱에 `디지털 서명`을 해야 합니다.

1. keystore 만들기
   아래 명령어를 사용
   `keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`

- 이 파일은 항상 개인적으로 보관하세요.
- 절대 공개된 저장소에 올리지 마세요.

참고:

- keytool 은 프로젝트 경로에 존재하지 않을 수 있습니다.
- 해당 파일은 Android 스튜디오와 함께 설치되는 Java JDK 에 포함되는 파일입니다.
- 해당 파일에 대한 구체적인 경로는 명령줄에 flutter doctor -v 을 입력한 후, 표시되는 `java binary at:` 다음에 나타나는 경로에서 Java 를 포함하고 있는 디렉토리의 keytool 파일을 통해 확인할 수 있습니다.

2. 앱으로부터 keystore 참조하기
   keystore 참조에 관한 구성을 담을 `<app dir>/android/key.properties` 파일을 생성합니다.

```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=<key store 파일 위치, 예) /Users/<user name>/key.jks>
```

3. Gradle 에서 서명 구성하기
   앱의 서명을 구성하기 위하여 `<app dir>/android/app/build.gradle` 파일을 수정합니다.

- 이 외에는 공식 문서 참고하기

# 앱 번들(AAB - Android App Bundle) 과 APK(Android Package) 차이

APK 는 이미 완성된 안드로이드 앱 파일이고, AAB 는 APK 를 완성해주는 요소를 담은 패키지이다.
예를 들어, 어떤 앱을 설치할 때, 한국어 기반의 갤럭시 S21 과 독일어 기반의 갤럭시 S10 두 경우 모두 똑같은 APK 파일이 설치되는 것이 지금까지의 방법이었다.
하지만 AAB 형식으로 배포될 경우 사용자 기기에 필요한 파일만으로 구성된, 군더더기가 제거된 APK 파일을 설치할 수 있는 것이다.

### AAB 를 쓰면 좋은 점

1.  앱의 크기가 줄어든다.

### 단점

보안에 대한 우려가 있다.
모든 안드로이드 앱에는 개발자의 서명 파일이 들어간다.
서명을 하여 '이 앱을 만든 사람은 나'라는 증거를 남기는 것이다.
서명 파일은 개발자가 APK 파일에 직접 첨부한다.
따라서 누군가가 앱을 멋대로 변형해 배포하려 해도, 원래 개발자의 서명이 없기 때문에 공식 앱이 아님을 확인할 수 있다.

하지만 AAB 파일은 위에서 짚었듯이 완성된 앱이 아니라 완성품으로 태어날 수 있는 레고 블록의 모음이다.
그리고 사용자를 위해 레고 블록을 끼워 맞추는 것은 개발자가 아니라 구글 플레이다.
따라서 서명은 개발자가 아닌 구글 플레이가 대신하게 된다.
마치 부동산 계약할 때 대리인이 서명할 수 있는 것처럼, AAB로 배포되면 필연적으로 구글 플레이가 대리 서명을 하게 되는 것이다.

다른 이가 나 대신 서명하는 것은 (아무리 철저하게 진행된다고 해도) 찝찝함이 있을 수밖에 없다.
구글은 대리 서명에 있어 최고의 보안을 약속했지만, 만에 하나 구글이 레고 블록을 엉성하게 조립하거나, 없던 코드를 집어넣는 일이 생기면 그에 대한 사용자들의 불만은 개발자가 고스란히 떠안아야 한다.
사용자 입장에서는 APK건 AAB건 알 바 아니기 때문이다.
개발자 자신의 컨트롤 범위를 벗어난다는 점에서 우려하는 이가 많다.

# 플러터에서 핫 리로드란

일반적으로 Native iOS 혹은 Android 개발을 하다 보면 굉장히 스트레스 받는 요소는 개발적인 부분들뿐만 아니라 코드 변경 이후 빌드 시간이죠.

변경한 내용에 대해 빠르게 확인해보고 싶지만 그럴 수가 없는 게 현실이며 프로젝트가 커지면 커질수록 이 대기시간은 기하급수적으로 증가하게 됩니다.

따라서, 이런 부분을 정확히 알고 있는 Flutter에서 굉장히 장점으로 내세우는 기능이 바로 Hot Reload입니다. Hot Reload를 활용하면 변경 사항을 즉각적으로 확인할 수 있으며 코드의 변경 및 확인 사이클이 매우 짧아지게 되어 빠른 시도, 빠른 피드백이 가능하게 됩니다.

### 핫 리로드

기본적으로 업데이트된 소스 파일들이 Dart Virtual Machine 에 주입되면 Flutter 는 변경된 사항들을 기반으로 widget tree 를 재구성함으로써 변경 사항들이 빠르게 결과물에 적용되는 것을 볼 수 있습니다.

### Hot Restart, Full Restart 와의 차이점

- `Hot reload`: 앱의 State 는 유지하되 Widget Tree 만 재구성하고 `main() 및 initState() 는 다시 호출되지 않습니다.`
- `Hot Restart`: 앱을 새로 시작하며 기존의 State 를 잃게 됩니다.
- `Full Restart`: 기존 iOS, Android 빌드와 같이 전체 Swift, Kotlin 등을 모두 다시 컴파일 및 다시 실행합니다.

### Hot Reload 가 동작하지 않는 경우

기본적으로 많은 상황에서 Hot Reload 를 통해 즉각적으로 결과를 확인할 수 있지만 특정 케이스에서는 Hot Restart 혹은 Full Restart 를 활용해야 할 수 있습니다.

- 앱이 종료된 경우
  앱이 특수한 상황에서 종료된 경우에는 Hot Reload가 동작하지 않습니다.
- 변경된 부분에서 에러가 발생한 경우
  변경 지점에서 Compilation Error가 발생한 경우 Hot Reload가 동작하지 않지만 해당 Error를 수정한다면 바로 결과를 확인할 수 있습니다.
- Enumerated types
  Enumerated Type을 Class로 변경하거나 Class를 Enumerated Type으로 변경한 경우에는 Hot Reload 사용이 불가능합니다.
- 폰트 변경
  대부분의 assets에 대해 Hot Reload를 지원하지만 Font 변경의 경우 Hot Restart를 통해 변경해야 합니다.
- Generic types
  Generic type의 정의가 변경된 경우에도 Hot Reload는 동작하지 않습니다.
- Native Code
  Swift, Kotlin, Java 등의 Native Code를 수정한 경우에는 Full Restart를 진행해야 합니다.

https://yojkim.medium.com/flutter%EC%97%90%EC%84%9C%EC%9D%98-hot-reload%EB%9E%80-8fb2ecdc757f

# Flutter 빌드 에러 대응

Flutter 에서 `버전 업그레이드나 다운 그레이드를 하다보면 아래와 같이 빌드 에러가 발생`하는 경우를 볼 수 있습니다.
보통 이런 경우 `cache 되어 있는 파일들을 모두 삭제 후 다시 설치`하여 해결할 수 있습니다,
이런 방법으로 해결이 안된다면 단순 빌드가 꼬였다기보다는 flutter, Dart SDK, Android SDK, NDK, IOS, library 버전 등이 안 맞는 경우일 수 있기 떄문에 로그를 꼼꼼하게 확인해보아야 합니다.

### flutter clean

`flutter clean` 은 `/build 폴더에 있는 build-cache 를 삭제`합니다.
사용 시기의 예는 /ios 및 /android 폴더에 있는 플랫폼별 파일을 크게 변경할 때입니다.

```
Cleaning Xcode workspace... 3.1s
Deleting build... 1,021ms
Deleting .dart_tool... 2ms
Deleting .packages... 0ms
Deleting Generated.xcconfig... 0ms
Deleting flutter_export_environment.sh... 0ms
Deleting Flutter.podspec... 0ms
Deleting .flutter-plugins-dependencies... 0ms
Deleting .flutter-plugins... 0ms
```

### pubsec.yaml 내부의 종속성을 업데이트 하는 명령

How to delete the flutter packages in .pub-cache folder?
When we give `flutter clean`, it will delete the build folder in the current directory.
We can delete it manually, but my requirement is `to delete the packages in .pub-cache folder` using the command.

해결방법: `flutter pub cache clean` 명령을 치면 아래와 같이 뜬다.

```
This will remove everything inside /Users/jihyun/.pub-cache.
You will have to run `flutter pub get` again in each project.
Are you sure? (y/N)? y
Removing pub cache directory /Users/jihyun/.pub-cache.
```

참고로 `flutter pub cache` 명령만 치면 아래와 같이 뜬다.

```
Missing subcommand for "pub cache".

Usage: pub cache [arguments...]
-h, --help Print this usage information.

Available subcommands:
add Install a package.
clean Clears the global PUB_CACHE.
repair Reinstall cached packages.
```

혹은 이렇게 일반 명령줄 명령을 사용할 수 있습니다. `rm -r ~/.pub-cache`

Next time you run
`flutter pub get`

-> 그러면 프로젝트의 `pubspec.lock 파일에 지정된 패키지가 다시 다운로드`됩니다.

참고로 `pubspec.lock 삭제하고 flutter pub get` 을 하면 `pubspec.yaml 파일을 기반으로 하는 최신 비중단 버전을 가져옵니다`.

NOTE:

- 모든 글로벌 Pub 패키지도 .pub-cache 폴더에 저장되므로 다음에 필요할 때마다 다시 설치해야 합니다.
- 수행하려는 작업에 따라 삭제할 필요가 없습니다. 내가 생각할 수 있는 유일한 이유는 더 이상 사용하지 않는 이전 버전의 패키지를 삭제하여 공간을 절약하려는 경우입니다.

### Flutter 버전 업데이트 시 pub-cache 에러 발생 시 예제 해결 방법을 어떤 블로그에서 참고

확인해보니 .pub-cache 내에 있는 package 에서 Theme 사용 시 파라미터가 없다는 에러였다.
pubspec.yaml 파일에서는 get-3.8.0 을 사용하지 않았지만, 사용하고 잇는 package 에서 dependency 로 사용하고 있는 듯 하다.
pubspec.lock 파일을 보니 get 이라는 package 가 명시되어 있었고, 버전은 3.8.0 이었다.

사용하고 있는 package 에 대응하여 최신 버전으로 반영이 되어 있지 않을 수 있다고 생각되어 pubspec.lock 파일을 삭제 후 flutter pub get 명령어를 이용하여 pubspec.lock 을 갱신해주니 정상적으로 빌드가 되었다.

# 플러터 3.0.5 업데이트하면서 했던 방법

아무튼 위에 장황한 설명을 배제하고 플러터 3.0.5 업데이트하면서 했던 방법

1. flutter clean
2. flutter pub cache clean
3. flutter pub get

# 플러터 실제 빌드했던 방법 (apk 와 abb)

`flutter build apk && flutter build appbundle` 명령을 치자.
✓ Built build/app/outputs/flutter-apk/app-release.apk (42.6MB).
✓ Built build/app/outputs/bundle/release/app-release.aab (44.1MB).

하나의 폴더 cashfi_app 를 만들어준 뒤 -> cashfi_app 이동
`cp ~/danbi/cashfi-2.0-flutter/build/app/outputs/flutter-apk/app-release.apk ./app-release-0727.apk`
`cp ~/danbi/cashfi-2.0-flutter/build/app/outputs/bundle/release/app-release.aab ./app-release-0727.aab`

여기서 주의할 점은 yaml 파일에서 버전을 `version: 1.1.16+32` 이라고 하면 `1.1.17+33` 이렇게 올려야 한다.

# flutter 경로 설정

`cd fvm` >> `ll` >> `default, versions`
`cd default` >> `ll` >> `bin 확인`

# 스크롤 관련

```dart
class MyShoppingPage extends StatelessWidget {
  const MyShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: /*탭바의 수 만큼 */,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverPersistentHeader(delegate: /*탭바*/ ),
          SliverFillRemaining(
            // 탭바 뷰 내부에는 스크롤이 되는 위젯이 들어옴.
            hasScrollBody: true,
            child: TabBarView(),
          )
        ],
      ),
    );
  }
}
```

https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html

# Application Id 설정

모든 Android 앱에는 `com.example.myapp` 과 같이 자바 패키지 이름처럼 보이는 고유한 애플리케이션 ID 가 있습니다. `이 ID 로 기기와 Google Play 스토어에서 앱을 고유하게 식별`할 수 있습니다.
새 버전의 앱을 업로드하려면 `애플리케이션 ID` 와 `앱 서명에 사용할 인증서`가 원본 아티팩트와 같아야 합니다.
애플리케이션 ID 를 변경하면 Google Play 스토어는 업로드를 완전히 다른 앱으로 취급합니다.
따라서, 일단 앱을 게시한 후에는 `애플리케이션 ID 를 변경하면 안됩니다.`

아래에 나오는 것처럼 애플리케이션 ID 는 모듈의 `build.gradle` 파일에 `applicationId` 속성으로 정의됩니다.

```groovy
android {
    defaultConfig {
        applicationId "com.example.myapp"
        minSdkVersion 15
        targetSdkVersion 24
        versionCode 1
        versionName "1.0"
    }
    ...
}
```

Android 스튜디오에서 새 프로젝트를 생성하면 applicationId 는 설치 과정 중에 선택한 자바 스타일 패키지 이름과 정확히 일치합니다.
하지만 애플리케이션 ID 와 패키지 이름은 이 시점 이후로는 서로 관련이 없습니다.
코드의 패키지 이름(코드 네임스페이스) 을 변경할 수 있고 이름을 변경하더라도 애플리케이션 ID 에는 영향을 주지 않습니다.
반대의 경우도 마찬가지입니다.
단, 이때도 일단 앱을 게시한 후에는 애플리케이션 ID 를 변경하면 안됩니다.
또한 패키지 이름을 변경하면 다른 결과가 발생한다는 점을 알고 있어야 합니다... (이하 생략)

https://developer.android.com/studio/build/application-id.html

### 패키지 이름 변경

항상 프로젝트의 기본 `AndroidManifest.xml` 파일에 `package` 속성을 지정해야 합니다.
예를 들어, 제품 버전이나 빌드 유형에 맞는 메니페스트 파일이 추가로 있는 경우 최종적으로 병합된 메니페스트는 항상 우선순위가 가장 높은 메니페스트 파일에서 제공하는 패키지 이름을 사용합니다.

# 각 파일의 역할

- `AndroidManifest.xml`: 매니페스트 파일은 앱의 기본 특성을 설명하고 앱의 각 구성요소를 정의합니다.
- `build.gradle`: 이 이름을 가진 파일은 두 개입니다. 하나는 프로젝트용으로 'Project: My_First_App' 이고 다른 하나는 앱 모듈용으로 'Module: My_First_App.app'입니다.
  각 모듈에는 자체 `build.gradle` 파일이 있지만, 현재 이 프로젝트에는 하나의 모듈만 있습니다.
  각 모듈의 `build.gradle` 파일을 사용하여 Gradle 플러그인에서 앱을 빌드하는 방법을 제어합니다.
  이 파일에 관한 자세한 구성은 빌드 구성을 참고하세요.
