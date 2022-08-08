void main() {
  Engineer codeFactory = Engineer(
    languages: ['Dart', 'Java', 'JavaScript'],
    name: '코드팩토리',
    building: '여의도 위워크',
  );

  print(codeFactory.name); // null
  print(codeFactory.building); // 여의도 위워크
  print(codeFactory.languages); // [Dart, Java, JavaScript]

  codeFactory
      .sayInfo(); // 저의 이름은 코드팩토리 입니다. 제가 근무하는 건물은 여의도 위워크 입니다. 제가 사용할 수 있는 언어들은 Dart, Java, JavaScript 입니다.
  codeFactory.sayName(); // this.name은 null, super.name은 코드팩토리
}

// 직원
class Employee {
  final String? building;
  final String? name;

  Employee(
    String? building,
    String? name,
  )   : building = building,
        name = name;
}

// 엔지니어
// 사용할줄 아는 언어 - 리스트로
class Engineer extends Employee {
  List<String>? languages;
  // 만약에 같은 이름의 변수를 새로 선언하면, super.name과 this.name이 다른 것을 볼 수 있다
  @override
  String? name;

  Engineer({
    required List<String>? languages,
    required String? name,
    required String? building,
  })  : languages = languages,
        super(
          building,
          name,
        );

  void sayInfo() {
    print(
        '저의 이름은 ${super.name} 입니다. 제가 근무하는 건물은 ${building} 입니다. 제가 사용할 수 있는 언어들은 ${languages?.join(', ')} 입니다.');
  }

  void sayName() {
    print('this.name은 $name, super.name은 ${super.name}');
  }
}
