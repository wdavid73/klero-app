import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/shared/inputs/inputs.dart';
import 'package:klero_app/utils/stream_helpers.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final TaskBloc taskBloc;

  CreateTaskCubit({required this.taskBloc}) : super(CreateTaskState());

  void onSubmit({required String userId}) async {
    _touchEveryField();

    if (!state.isValid) return;

    emit(state.copyWith(isPosting: true));
    Map<String, dynamic> data = {
      "id": state.id == 'new' ? null : state.id,
      "title": state.title.value,
      "description": state.description.value,
      "date": state.date.value,
      "type": state.id == 'new' ? 'to_do' : null,
      "user_id": userId,
    };

    if (state.id != 'new') {
      taskBloc.updateTask(data);
    } else {
      taskBloc.addTask(data);
    }

    await waitForState(
      stream: taskBloc.stream,
      condition: (state) =>
          state.status == TaskStatus.created ||
          state.status == TaskStatus.updated ||
          state.status == TaskStatus.error,
    );

    _clearInputs();
    emit(state.copyWith(isPosting: false));
  }

  void titleChanged(String value) {
    final title = TextInput.dirty(value: value);
    emit(state.copyWith(
      title: title,
      isValid: Formz.validate([title, state.description, state.date]),
    ));
  }

  void descriptionChanged(String value) {
    final description = TextInput.dirty(value: value);
    emit(state.copyWith(
      description: description,
      isValid: Formz.validate([description, state.title, state.date]),
    ));
  }

  void dateChanged(DateTime value) {
    final date = Date.dirty(value: value);
    emit(state.copyWith(
      date: date,
      isValid: Formz.validate([date, state.description, state.title]),
    ));
  }

  void _touchEveryField() {
    final title = TextInput.dirty(value: state.title.value);
    final description = TextInput.dirty(value: state.description.value);
    final date = Date.dirty(value: state.date.value);

    emit(state.copyWith(
      isFormPosted: true,
      title: title,
      description: description,
      date: date,
      isValid: Formz.validate([title, description, date]),
    ));
  }

  void _clearInputs() {
    emit(state.copyWith(
      title: TextInput.pure(),
      description: TextInput.pure(),
      date: Date.pure(),
    ));
  }

  void setFormField(Task? task) {
    if (task != null) {
      emit(state.copyWith(
        id: task.id,
        title: TextInput.dirty(value: task.title),
        description: TextInput.dirty(value: task.description ?? ''),
        date: Date.dirty(value: DateTime.tryParse(task.date)),
      ));
      return;
    } else {
      emit(state.copyWith(
        id: "new",
        title: TextInput.pure(),
        description: TextInput.pure(),
        date: Date.pure(),
      ));
      return;
    }
  }
}
