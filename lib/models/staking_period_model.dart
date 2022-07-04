// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_app/models/staking_data_model.dart';

class StakingPeriod {
  StakingData? termintaion;
  StakingData? inProgress;
  StakingData? preparation;

  StakingPeriod({
    required this.termintaion,
    required this.inProgress,
    required this.preparation,
  });

  StakingPeriod copyWith({
    StakingData? termintaion,
    StakingData? inProgress,
    StakingData? preparation,
  }) {
    return StakingPeriod(
      termintaion: termintaion ?? this.termintaion,
      inProgress: inProgress ?? this.inProgress,
      preparation: preparation ?? this.preparation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'termintaion': termintaion?.toMap(),
      'inProgress': inProgress?.toMap(),
      'preparation': preparation?.toMap(),
    };
  }

  factory StakingPeriod.fromMap(Map<String, dynamic> map) {
    return StakingPeriod(
      termintaion: map['termintaion'] != null
          ? StakingData.fromMap(map['termintaion'] as Map<String, dynamic>)
          : null,
      inProgress: map['inProgress'] != null
          ? StakingData.fromMap(map['inProgress'] as Map<String, dynamic>)
          : null,
      preparation: map['preparation'] != null
          ? StakingData.fromMap(map['preparation'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StakingPeriod.fromJson(String source) =>
      StakingPeriod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StakingPeriod(termintaion: $termintaion, inProgress: $inProgress, preparation: $preparation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StakingPeriod &&
        other.termintaion == termintaion &&
        other.inProgress == inProgress &&
        other.preparation == preparation;
  }

  @override
  int get hashCode =>
      termintaion.hashCode ^ inProgress.hashCode ^ preparation.hashCode;
}
