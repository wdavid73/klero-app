import 'package:klero_app/api/response.dart';
import 'package:klero_app/data/models/task_model.dart';
import 'package:klero_app/domain/datasources/tasks_datasource.dart';
import 'package:klero_app/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  final TasksDatasource datasource;

  TasksRepositoryImpl(this.datasource);

  @override
  Future<ResponseState> getTasks({String type = '', required String uid}) {
    return datasource.getTasks(type: type, uid: uid);
  }

  @override
  Future<ResponseState> createTask(Map<String, dynamic> task) {
    return datasource.createTask(task);
  }

  @override
  Future<ResponseState> deleteTask(String taskId) {
    return datasource.deleteTask(taskId);
  }

  @override
  Future<ResponseState> promoteTask(String taskId, String promote) {
    return datasource.promoteTask(taskId, promote);
  }

  @override
  Future<ResponseState> updateTask(TaskModel task) {
    return datasource.updateTask(task);
  }
}
