part of 'create_task_cubit.dart';

class CreateTaskState extends Equatable {
  final String? id;
  final TextInput title;
  final TextInput description;
  final Date date;
  final bool isValid;
  final bool isPosting;
  final bool isFormPosted;

  const CreateTaskState({
    this.id,
    this.title = const TextInput.pure(),
    this.description = const TextInput.pure(),
    this.date = const Date.pure(),
    this.isPosting = false,
    this.isValid = false,
    this.isFormPosted = false,
  });

  @override
  List<Object> get props => [
        title,
        description,
        date,
        isPosting,
        isValid,
        isFormPosted,
      ];

  CreateTaskState copyWith({
    String? id,
    TextInput? title,
    TextInput? description,
    Date? date,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
  }) =>
      CreateTaskState(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
      );
}
