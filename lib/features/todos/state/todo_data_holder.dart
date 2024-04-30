import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((_) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  TodoDataHolder() : super([]);

  void changeTodoStatus(Todo todo) {
    final newTodo = todo.copyWith(isComplete: !todo.isComplete);
    state = [...state.map((e) => e.id == todo.id ? newTodo : e)];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void deleteTodo(Todo todo) {
    state = [...state.where((e) => e.id != todo.id)];
  }
}

extension TodoDataHolderProvider on WidgetRef {
  TodoDataHolder get readTodoDataHolder => read(todoDataProvider.notifier);
}
