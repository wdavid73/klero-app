part of 'task_bloc.dart';

mixin TaskBlocHandler on Bloc<TaskEvent, TaskState> {
  Future<void> handlerGetTask(
    GetTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    String type = event.type == state.filter ? '' : event.type;
    emit(state.copyWith(
      isLoading: true,
      status: TaskStatus.none,
      filter: type,
    ));
    final response =
        await (this as TaskBloc).useCase.getTasks(type: type, uid: event.uid);

    if (response is ResponseFailed) {
      emit(state.copyWith(
        isLoading: false,
        tasks: [],
        error: response.error!.message.toString(),
        status: TaskStatus.error,
        counts: {},
      ));
    }

    Map<String, dynamic> data = response.data as Map<String, dynamic>;
    List<Task> tasks = data["tasks"];
    Map<String, int> counts = data["counts"];

    emit(state.copyWith(
      isLoading: false,
      tasks: tasks,
      counts: counts,
      error: '',
    ));
  }

  Future<void> handlerCreateTask(
    CreateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.none, creatingTask: true));

    final response = await (this as TaskBloc).useCase.createTask(event.task);

    if (response is ResponseFailed) {
      emit(state.copyWith(
        status: TaskStatus.error,
        creatingTask: false,
        error: response.error!.message.toString(),
      ));
      return;
    }
    Task task = response.data as Task;
    emit(state.copyWith(
      status: TaskStatus.created,
      creatingTask: false,
      tasks: [task, ...state.tasks],
      error: null,
    ));
  }

  Future<void> handlerUpdateTask(
    EditTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.none, creatingTask: true));
    final TaskModel task = TaskModel.fromJson(event.task);
    final response = await (this as TaskBloc).useCase.updateTask(task);

    if (response is ResponseFailed) {
      emit(state.copyWith(
        creatingTask: false,
        status: TaskStatus.error,
        error: response.error!.message.toString(),
      ));
    }

    TaskModel taskUpdated = response.data as TaskModel;

    emit(state.copyWith(
      creatingTask: false,
      error: null,
      status: TaskStatus.updated,
      tasks: state.tasks
          .map((e) => e.id == taskUpdated.id ? taskUpdated : e)
          .toList(),
    ));
  }

  Future<void> handlerDeleteTask(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.none, isLoading: true));
    final response = await (this as TaskBloc).useCase.deleteTask(event.task.id);

    if (response is ResponseFailed) {
      emit(state.copyWith(
        error: response.error!.message.toString(),
        status: TaskStatus.error,
        isLoading: false,
      ));
    }

    emit(state.copyWith(
      tasks: state.tasks.where((e) => e.id != event.task.id).toList(),
      isLoading: false,
      status: TaskStatus.deleted,
    ));
  }

  Future<void> handlerPromoteTask(
    PromoteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.none, isLoading: true));

    final response = await (this as TaskBloc).useCase.promoteTask(
          event.task.id,
          event.promote,
        );

    if (response is ResponseFailed) {
      emit(state.copyWith(
        error: response.error!.message.toString(),
        status: TaskStatus.error,
        isLoading: false,
      ));
    }

    emit(state.copyWith(
      error: null,
      status: TaskStatus.updated,
      isLoading: false,
      tasks: state.tasks
          .map((e) => e.id == event.task.id
              ? event.task.copyWith(type: event.promote)
              : e)
          .toList(),
    ));
  }
}
