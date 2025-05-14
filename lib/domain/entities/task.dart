import 'package:klero_app/domain/entities/base_entity.dart';

class Task extends BaseEntity {
  @override
  final String id;
  final String title;
  final String date;
  final String type;
  final String? description;

  Task({
    required this.id,
    required this.title,
    required this.date,
    this.description,
    this.type = "to_do",
  }) : super();

  Task copyWith({
    String? id,
    String? title,
    String? date,
    String? type,
    String? description,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        type: type ?? this.type,
      );
}
