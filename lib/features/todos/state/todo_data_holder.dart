import 'package:do_what_to_do/features/todos/duymmy_todos.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((_) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  TodoDataHolder() : super([]) {
    for (final todo in dummyTodos) {
      addTodo(todo);
    }
  }

  void changeTodoStatus(Todo todo) {
    final newTodo = todo.copyWith(isComplete: !todo.isComplete);
    state = [...state.map((e) => e.id == todo.id ? newTodo : e)];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
}

extension TodoDataHolderProvider on WidgetRef {
  TodoDataHolder get readTodoDataHolder => read(todoDataProvider.notifier);
}
