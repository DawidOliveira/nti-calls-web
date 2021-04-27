import 'dart:convert';

enum TaskStatus {
  pending,
  in_progress,
  done,
}

class TaskModel {
  String id;
  String username;
  String setor;
  String desc;
  String place;
  TaskStatus status;
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.username,
    required this.setor,
    required this.desc,
    required this.place,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'setor': setor,
      'desc': desc,
      'place': place,
      'status': status,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      username: map['username'],
      setor: map['setor'],
      desc: map['desc'],
      place: map['place'],
      status: map['status'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
