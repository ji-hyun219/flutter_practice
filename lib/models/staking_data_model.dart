import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StakingData {
  final int id;
  final String status;
  final String startAt;
  final String endAt;
  final int rate;
  final int rewardRate;
  final String objectiveToken;
  final String token;
  final int round;

  StakingData({
    required this.id,
    required this.status,
    required this.startAt,
    required this.endAt,
    required this.rate,
    required this.rewardRate,
    required this.objectiveToken,
    required this.token,
    required this.round,
  });

  StakingData copyWith({
    int? id,
    String? status,
    String? startAt,
    String? endAt,
    int? rate,
    int? rewardRate,
    String? objectiveToken,
    String? token,
    int? round,
  }) {
    return StakingData(
      id: id ?? this.id,
      status: status ?? this.status,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      rate: rate ?? this.rate,
      rewardRate: rewardRate ?? this.rewardRate,
      objectiveToken: objectiveToken ?? this.objectiveToken,
      token: token ?? this.token,
      round: round ?? this.round,
    );
  }

  @override
  String toString() {
    return 'StakingData(id: $id, status: $status, startAt: $startAt, endAt: $endAt, rate: $rate, rewardRate: $rewardRate, objectiveToken: $objectiveToken, token: $token, round: $round)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'startAt': startAt,
      'endAt': endAt,
      'rate': rate,
      'rewardRate': rewardRate,
      'objectiveToken': objectiveToken,
      'token': token,
      'round': round,
    };
  }

  factory StakingData.fromMap(Map<String, dynamic> map) {
    return StakingData(
      id: map['id'] as int,
      status: map['status'] as String,
      startAt: map['startAt'] as String,
      endAt: map['endAt'] as String,
      rate: map['rate'] as int,
      rewardRate: map['rewardRate'] as int,
      objectiveToken: map['objectiveToken'] as String,
      token: map['token'] as String,
      round: map['round'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StakingData.fromJson(String source) =>
      StakingData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StakingData &&
        other.id == id &&
        other.status == status &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        other.rate == rate &&
        other.rewardRate == rewardRate &&
        other.objectiveToken == objectiveToken &&
        other.token == token &&
        other.round == round;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        status.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        rate.hashCode ^
        rewardRate.hashCode ^
        objectiveToken.hashCode ^
        token.hashCode ^
        round.hashCode;
  }
}
