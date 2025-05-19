import 'package:klero_app/data/mappers/task_mapper.dart';
import 'package:klero_app/data/models/json_serializable.dart';
import 'package:klero_app/domain/entities/task.dart';

class TaskModel extends Task implements JsonSerializable {
  TaskModel({
    required super.id,
    required super.title,
    required super.date,
    super.description,
    super.type,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskMapper.taskJsonToModel(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return TaskMapper.toJson(this);
  }
}
