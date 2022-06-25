class Address {
  final String city;
  final List<String> streets;

  Address({required this.city, required this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
      city: parsedJson['city'],
      streets: parsedJson['streets'],
    );
  }
}
