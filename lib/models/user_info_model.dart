// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfo {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;

  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  // factory UserInfo.fromJson(Map<String, dynamic> json) {
  //   return UserInfo(
  //     name: json["name"],
  //     job: json["job"],
  //     id: json["id"],
  //     createdAt: json["createdAt"],
  //     updatedAt: json["updatedAt"],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] as String,
      job: map['job'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
