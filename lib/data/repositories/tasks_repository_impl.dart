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
  Future<ResponseState> deleteTask(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> promoteTask(String taskId, String promote) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> createTask(TaskModel task) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> updateTask(TaskModel task) {
    throw UnimplementedError();
  }
}
