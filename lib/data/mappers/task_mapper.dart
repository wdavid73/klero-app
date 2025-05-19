import 'package:klero_app/data/models/task_model.dart';

class TaskMapper {
  static TaskModel taskJsonToModel(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
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
