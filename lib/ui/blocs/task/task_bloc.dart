import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/domain/entities/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<CreateOrUpdateTaskEvent>((event, emit) {
      emit(state.copyWith(status: TaskStatus.none, creatingTask: true));
      try {
        final isTaskInList = state.tasks.any((e) => e.id == event.task["id"]);

        if (!isTaskInList) {
          Task task = Task(
            id: "${state.tasks.length + 1}",
            title: event.task["title"],
            description: event.task["description"],
            date: event.task["date"].toString(),
          );

          emit(state.copyWith(
            tasks: [...state.tasks, task],
            status: TaskStatus.created,
            creatingTask: false,
          ));
          return;
        }

        Task task = Task(
          id: event.task["id"].toString(),
          title: event.task["title"],
          description: event.task["description"],
          date: event.task["date"].toString(),
        );
        emit(state.copyWith(
          tasks: state.tasks
              .map((e) => e.id == event.task["id"] ? task : e)
              .toList(),
          status: TaskStatus.updated,
          creatingTask: false,
        ));
        return;
      } catch (e) {
        emit(state.copyWith(
          status: TaskStatus.error,
          error: e.toString(),
          creatingTask: false,
        ));
      }
    });

    on<DeleteTaskEvent>((event, emit) {
      bool exist = state.tasks.any((e) => e.id == event.task.id);
      if (exist) {
        emit(state.copyWith(
          tasks: state.tasks.where((e) => e.id != event.task.id).toList(),
        ));
      }
    });

    on<PromoteTaskEvent>((event, emit) {
      bool exist = state.tasks.any((e) => e.id == event.task.id);
      if (exist) {
        emit(state.copyWith(
          tasks: state.tasks
              .map((e) => e.id == event.task.id
                  ? event.task.copyWith(type: event.promote)
                  : e)
              .toList(),
        ));
      }
    });

    on<CreateMultipleTask>((event, emit) {
      List<Task> taskMultiple = [];
      Random random = Random();
      List<String> types = ["to_do", "in_review", "complete"];
      for (var i = 0; i < 20; i++) {
        taskMultiple.add(Task(
          id: "${i + 1}",
          title: "Task #${i + 1}",
          description: "Description #${i + 1}",
          date: DateTime.now().toString(),
          type: types[random.nextInt(types.length)],
        ));
      }
      emit(state.copyWith(tasks: taskMultiple));
    });

    on<FilterTasksEvent>((event, emit) async {
      String filter = event.filter;
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
        isLoading: false,
        filter: state.filter == filter ? '' : filter,
        filteredTask: state.filter != filter
            ? state.tasks.where((e) => e.type == event.filter).toList()
            : [],
      ));
    });
  }

  void addTask(Map<String, dynamic> task) {
    add(CreateOrUpdateTaskEvent(task: task));
  }

  void deleteTask(Task task) {
    add(DeleteTaskEvent(task: task));
  }

  void promoteTask({required String promote, required Task task}) {
    add(PromoteTaskEvent(promote: promote, task: task));
  }

  void createMultiple() {
    add(CreateMultipleTask());
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
