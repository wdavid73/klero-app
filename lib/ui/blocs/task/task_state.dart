part of 'task_bloc.dart';

enum TaskStatus {
  none,
  created,
  updated,
  deleted,
  error,
}

class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskStatus status;
  final String? error;
  final bool creatingTask;
  final bool isLoading;
  final String filter;

  const TaskState({
    this.tasks = const <Task>[],
    this.status = TaskStatus.none,
    this.error,
    this.creatingTask = false,
    this.isLoading = false,
    this.filter = '',
  });

  @override
  List<Object> get props => [
        tasks,
        status,
        creatingTask,
        isLoading,
        filter,
      ];

  TaskState copyWith({
    List<Task>? tasks,
    TaskStatus? status,
    String? error,
    bool? creatingTask,
    bool? isLoading,
    String? filter,
  }) =>
      TaskState(
        tasks: tasks ?? this.tasks,
        status: status ?? this.status,
        error: error ?? this.error,
        creatingTask: creatingTask ?? this.creatingTask,
        isLoading: isLoading ?? this.isLoading,
        filter: filter ?? this.filter,
      );
}
