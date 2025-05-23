import 'package:klero_app/api/api.dart';
import 'package:klero_app/data/data.dart';
import 'package:klero_app/domain/repositories/tasks_repository.dart';

class TasksUsecases {
  final TasksRepository repository;

  TasksUsecases(this.repository);

  Future<ResponseState> getTasks({String type = '', required String uid}) {
    return repository.getTasks(type: type, uid: uid);
  }

  Future<ResponseState> createTask(Map<String, dynamic> task) {
    return repository.createTask(task);
  }

  Future<ResponseState> deleteTask(String taskId) {
    return repository.deleteTask(taskId);
  }

  Future<ResponseState> promoteTask(String taskId, String promote) {
    return repository.promoteTask(taskId, promote);
  }

  Future<ResponseState> updateTask(TaskModel task) {
    return repository.updateTask(task);
  }
}
