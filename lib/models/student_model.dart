class Student {
  String studentId;
  String studentName;
  int studentScores;

  Student(
      {required this.studentId,
      required this.studentName,
      required this.studentScores});

  // json 을 deserialize == string -> data
  // Json.parse 메서드는 JSON 포맷의 문자열을 객체로 변환한다.
  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        studentId: parsedJson['id'],
        studentName: parsedJson['name'],
        studentScores: parsedJson["score"]);
  }
}
