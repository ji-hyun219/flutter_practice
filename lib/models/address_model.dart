class Address {
  final String city;
  final List<String> streets;

  Address({required this.city, required this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson = parsedJson['streets'];
    List<String> streetsList = streetsFromJson.cast<String>();
    return Address(
      city: parsedJson['city'],
      streets: streetsList,
      // streets: parsedJson['streets'], // ..에러
      // 에러내용: List<dynamic> 은 List<String> 에 맞지 않는다
    );
  }
}
