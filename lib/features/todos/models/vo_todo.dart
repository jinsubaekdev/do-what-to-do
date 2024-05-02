import 'dart:convert';

import 'package:do_what_to_do/common/data/local/collections/todo_db_model.dart';
import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'vo_todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    required String id,
    required DateTime createdAt,
    required String title,
    required bool isComplete,
    String? description,
    required List<SubTodo> subTodos,
  }) = _Todo;

  factory Todo.empty() {
    return Todo(
      id: const Uuid().v4(),
      createdAt: DateTime.timestamp(),
      title: '',
      isComplete: false,
      subTodos: [],
    );
  }

  TodoDbModel toDbModel() {
    final subTodosInJson = jsonEncode([...subTodos.map((e) => e.toJson())]);
    return TodoDbModel(id, createdAt, title, isComplete, description, subTodosInJson);
  }
}
