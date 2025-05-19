import 'package:klero_app/api/api.dart';
import 'package:klero_app/domain/repositories/tasks_repository.dart';

class TasksUsecase {
  final TasksRepository repository;

  TasksUsecase(this.repository);

  Future<ResponseState> getTasks({String type = '', required String uid}) {
    return repository.getTasks(type: type, uid: uid);
  }
}
