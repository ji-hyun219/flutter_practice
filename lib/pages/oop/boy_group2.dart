void main() {
  BoyGroup bts = BoyGroup('BTS');

  bts.sayName();

  GirlGroup redVelvet = GirlGroup('레드벨벳');

  redVelvet.sayName();
}

class IdolInterface {
  String? name;

  void sayName() {}
}

// Q. Interface 대신, 상속을 활용하면 되는 거 아닌가?
class Idol {
  final String? name;

  Idol(String name) : name = name;

  void sayName() {}
}

class BoyGroup extends Idol {
  // 이렇게 하면 똑같은 거 아닌가요?
  // 똑같지만, 뉘앙스가 다르다.
  // #1 상속에서 오는 것은 '부모에 있는 것들을 전부 상속을 받는 것'이고,
  BoyGroup(String name) : super(name);

  @override
  void sayName() {
    print('제 이름은 ${name} 입니다.');
  }
}

// #2 Interface 같은 경우에는 '무조건 선언해줘!'라고 강제하는 느낌이다.
// #3 상속을 써도 될 거 같고, Interface를 써도 될 거 같은 상황에서는
// 어떤 것을 써도 상관이 없다. 코딩은 언제나 유연하게, 가장 적합한 것을 사용하는 것이기때문에
// 어떤 것을 사용해도 논리적으로 맞다! 라면 둘 중 어떤 것을 사용해도 문제가 없다.
// #4 강제하고 싶다면 Interface를 사용하는 게, 더 좋은 방향일 수 있다.
class GirlGroup implements IdolInterface {
  @override
  String? name;

  GirlGroup(String name) : name = name;

  @override
  void sayName() {
    print('제 이름은 ${name} 입니다.');
  }
}
