import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_sub_todo.freezed.dart';

part 'vo_sub_todo.g.dart';

@freezed
class SubTodo with _$SubTodo {
  const factory SubTodo({
    required String id,
    required String title,
    @Default(false) bool isComplete,
  }) = _SubTodo;

  factory SubTodo.fromJson(Map<String, dynamic> json) => _$SubTodoFromJson(json);
}
