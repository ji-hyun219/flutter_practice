import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Wallet {
  int id;
  String withdrawAt;
  String walletAddress;
  Wallet({
    required this.id,
    required this.withdrawAt,
    required this.walletAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'withdrawAt': withdrawAt,
      'walletAddress': walletAddress,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'] as int,
      withdrawAt: map['withdrawAt'] as String,
      walletAddress: map['walletAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) =>
      Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  Wallet copyWith({
    int? id,
    String? withdrawAt,
    String? walletAddress,
  }) {
    return Wallet(
      id: id ?? this.id,
      withdrawAt: withdrawAt ?? this.withdrawAt,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }
}
