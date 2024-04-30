import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_sub_todo.freezed.dart';

@freezed
class SubTodo with _$SubTodo {
  const factory SubTodo({
    required String id,
    required String title,
    required bool isComplete,
  }) = _SubTodo;
}
