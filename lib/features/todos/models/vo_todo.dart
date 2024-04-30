import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required bool isComplete,
    String? description,
    @Default([]) List<SubTodo> subTodos,
  }) = _Todo;
}
