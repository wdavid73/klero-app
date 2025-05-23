import 'package:klero_app/api/api.dart';
import 'package:klero_app/data/models/task_model.dart';

abstract class TasksRepository {
  Future<ResponseState> getTasks({String type = '', required String uid});
  Future<ResponseState> deleteTask(String taskId);
  Future<ResponseState> promoteTask(String taskId, String promote);
  Future<ResponseState> createTask(Map<String, dynamic> task);
  Future<ResponseState> updateTask(TaskModel task);
}
