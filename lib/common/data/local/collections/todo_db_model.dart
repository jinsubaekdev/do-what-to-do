import 'dart:convert';

import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:isar/isar.dart';

part 'todo_db_model.g.dart';

@collection
class TodoDbModel {
  final String id;

  Id get isarId => fastHash(id);

  @Index(type: IndexType.value)
  final DateTime createdAt;

  final String title;

  final bool isComplete;

  final String? description;

  final String subTodosInJson;

  TodoDbModel(
      this.id, this.createdAt, this.title, this.isComplete, this.description, this.subTodosInJson);

  Todo toEntity() {
    final subTodos = List.from(jsonDecode(subTodosInJson)).map((e) => SubTodo.fromJson(e)).toList();
    return Todo(
      id: id,
      createdAt: createdAt,
      title: title,
      isComplete: isComplete,
      description: description,
      subTodos: subTodos,
    );
  }
}

/// FNV-1a 64bit hash algorithm optimized for Dart Strings
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
