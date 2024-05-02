import 'package:do_what_to_do/common/data/local/app_database.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoDataProvider =
    StateNotifierProvider<TodoDataHolder, List<Todo>>((_) => TodoDataHolder(AppDatabase.instance));

class TodoDataHolder extends StateNotifier<List<Todo>> {
  final AppDatabase appDatabase;

  TodoDataHolder(this.appDatabase) : super([]) {
    appDatabase.getAllTodos().then((todos) => state = todos);
  }

  void changeTodoStatus(Todo todo) {
    final newTodo = todo.copyWith(isComplete: !todo.isComplete);
    state = [...state.map((e) => e.id == todo.id ? newTodo : e)];
  }

  void addOrUpdateTodo(Todo todo) {
    final isOldTodo = state.any((e) => e.id == todo.id);
    if (isOldTodo) {
      state = [...state.map((e) => e.id == todo.id ? todo : e)];
    } else {
      state = [...state, todo];
    }
    appDatabase.addOrUpdateTodo(todo);
  }

  void deleteTodo(Todo todo) {
    state = [...state.where((e) => e.id != todo.id)];
    appDatabase.deleteTodo(todo);
  }
}

extension TodoDataHolderProvider on WidgetRef {
  TodoDataHolder get readTodoDataHolder => read(todoDataProvider.notifier);
}
