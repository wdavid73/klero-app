import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/api/response.dart';
import 'package:klero_app/data/data.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/domain/usecases/tasks_usecases.dart';

part 'task_bloc_handler.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> with TaskBlocHandler {
  final TasksUsecases useCase;
  TaskBloc(this.useCase) : super(TaskState()) {
    on<GetTaskEvent>(handlerGetTask);
    on<CreateTaskEvent>(handlerCreateTask);
    on<EditTaskEvent>(handlerUpdateTask);
    on<DeleteTaskEvent>(handlerDeleteTask);
    on<PromoteTaskEvent>(handlerPromoteTask);

    on<FilterTasksEvent>((event, emit) async {
      String filter = event.filter;
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
        isLoading: false,
        filter: state.filter == filter ? '' : filter,
      ));
    });
  }

  void getTasks({String type = '', required String uid}) {
    add(GetTaskEvent(type: type, uid: uid));
  }

  void addTask(Map<String, dynamic> task) {
    add(CreateTaskEvent(task: task));
  }

  void deleteTask(Task task) {
    add(DeleteTaskEvent(task: task));
  }

  void promoteTask({required String promote, required Task task}) {
    add(PromoteTaskEvent(promote: promote, task: task));
  }

  void updateTask(Map<String, dynamic> task) {
    add(EditTaskEvent(task: task));
  }

  void filterTags(String filter) {
    add(FilterTasksEvent(filter: filter));
  }

  Task? getTaskById(String taskId) {
    final exist = state.tasks.any((e) => e.id == taskId);
    if (!exist) return null;
    return state.tasks.firstWhere((e) => e.id == taskId);
  }
}
