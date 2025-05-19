part of 'task_bloc.dart';

abstract class TaskEvent {}

class GetTaskEvent extends TaskEvent {
  final String type;
  final String uid;
  GetTaskEvent({required this.uid, this.type = ''});
}

class CreateOrUpdateTaskEvent extends TaskEvent {
  Map<String, dynamic> task;
  CreateOrUpdateTaskEvent({required this.task});
}

class DeleteTaskEvent extends TaskEvent {
  Task task;
  DeleteTaskEvent({required this.task});
}

class EditTaskEvent extends TaskEvent {
  Task task;
  EditTaskEvent({required this.task});
}

class GetTaskByIdEvent extends TaskEvent {
  String taskId;
  GetTaskByIdEvent({required this.taskId});
}

class PromoteTaskEvent extends TaskEvent {
  String promote;
  Task task;
  PromoteTaskEvent({required this.promote, required this.task});
}

class CreateMultipleTask extends TaskEvent {}

class FilterTasksEvent extends TaskEvent {
  String filter;
  FilterTasksEvent({required this.filter});
}
