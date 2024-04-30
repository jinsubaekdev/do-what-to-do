import 'package:do_what_to_do/common/widgets/w_empty_state.dart';
import 'package:do_what_to_do/common/widgets/w_todo_item.dart';
import 'package:do_what_to_do/features/todos/state/todo_data_holder.dart';
import 'package:do_what_to_do/features/write_todo/s_write_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoDataProvider);

    if (todoList.isEmpty) {
      return EmptyState();
    }

    return SingleChildScrollView(
      child: Column(
        children: todoList.map((e) {
          return TodoItem(
            todo: e,
            onCheckPressed: () => ref.readTodoDataHolder.changeTodoStatus(e),
            onContentPressed: () => WriteTodoScreen.navigate(context: context, todo: e),
          );
        }).toList(),
      ),
    );
  }
}
