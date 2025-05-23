import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:klero_app/data/models/task_model.dart';

class TaskMapper {
  static TaskModel taskJsonToModel(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        date: convertTimestampToString(json["date"]),
        description: json["description"] ?? '',
        type: json["type"] ?? 'to_do',
      );

  static Map<String, dynamic> toJson(TaskModel task) => {
        'id': task.id,
        'title': task.title,
        'date': task.date,
        'description': task.description ?? '',
        'type': task.type,
      };
}

String convertTimestampToString(dynamic time) {
  if (time.runtimeType == Timestamp) {
    DateTime date = time.toDate();
    DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    return formatter.format(date);
  }

  if (time.runtimeType == DateTime) {
    return (time as DateTime).toString();
  }
  return time as String;
}
