void main() {
  BoyGroup bts = BoyGroup('BTS');

  bts.sayName();

  GirlGroup redVelvet = GirlGroup('레드벨벳');

  redVelvet.sayName();
}

// #1 Interface 선언
class IdolInterface {
  // IdolInterface에서 BoyGroup과 GirlGroup에서 필수로 지정해야하는 변수와 함수(메서드)를 넣는다
  String? name;

  void sayName() {}

  // Interface에서는 어떤 함수를 지정해라~ 라는 것만 말해주는 것이기때문에 함수의 body를 작성할 필요가 없다
  // void noBody() {
  //  print('${this.name}');
  //}
}

// #2 Interface 사용 => implements 키워드를 사용 + class(interface가 된다)
class BoyGroup implements IdolInterface {
  @override
  String? name;

  BoyGroup(String name) : name = name;

  @override
  void sayName() {
    print('제 이름은 ${name} 입니다.');
  }
}

class GirlGroup implements IdolInterface {
  @override
  String? name;

  GirlGroup(String name) : name = name;

  @override
  void sayName() {
    print('제 이름은 ${name} 입니다.');
  }
}
