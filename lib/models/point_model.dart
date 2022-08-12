class MyPoints {
  final int accumulatedPoint;
  final int usedPoint;
  final int expirePoint;

  MyPoints({
    required this.accumulatedPoint,
    required this.usedPoint,
    required this.expirePoint,
  });

  MyPoints.initial({
    this.accumulatedPoint = 0,
    this.usedPoint = 0,
    this.expirePoint = 0,
  });

  factory MyPoints.fromJson(Map<String, dynamic> json) {
    return MyPoints(
      accumulatedPoint: json['accumulatedPoint'],
      usedPoint: json['usedPoint'],
      expirePoint: json['expirePoint'],
    );
  }

  int get total => accumulatedPoint - usedPoint - expirePoint;

  MyPoints copyWith({
    int? accumulatedPoint,
    int? usedPoint,
    int? expirePoint,
  }) {
    return MyPoints(
      accumulatedPoint: accumulatedPoint ?? this.accumulatedPoint,
      usedPoint: usedPoint ?? this.usedPoint,
      expirePoint: expirePoint ?? this.expirePoint,
    );
  }
}
