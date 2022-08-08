void main() {
  // #1 기본
  Idol idol = Idol('슬기', '레드벨벳');

  // * '.' 점 하나는 메서드를 실행할 때, 사용할 수 있다.
  // 메서드가 적으면 문제가 없는데, 여러개라면? Cascade Operator을 활용하자
  idol.sayName(); // 제 이름은 슬기 입니다.
  idol.sayGroup(); // 저는 레드벨벳 소속입니다.

  // * '..' 점 두개는 이어서 메서드를 여러개 실행할 때, 사용할 수 있다.
  // #2 Cascade Operator 활용
  idol
    ..sayName() // 제 이름은 슬기 입니다.
    ..sayGroup(); // 저는 레드벨벳 소속입니다.

  // #3
  Idol('슬기', '레드벨벳')
    ..sayName() // 제 이름은 슬기 입니다.
    ..sayGroup(); // 저는 레드벨벳 소속입니다.
}

// Cascade Operator
// => idol..sayName(); '..' 쩜 2개?

class Idol {
  String name;
  String group;

  Idol(String name, String group)
      : name = name,
        group = group;

  void sayName() {
    print('제 이름은 ${name} 입니다.');
  }

  void sayGroup() {
    print('저는 ${group} 소속입니다.');
  }
}
