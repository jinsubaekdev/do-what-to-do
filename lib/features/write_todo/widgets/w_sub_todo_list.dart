import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:do_what_to_do/features/write_todo/models/controllable_sub_todo.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_sub_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SubTodoList extends StatelessWidget {
  static const topMarginValue = 16.0;

  final List<ControllableSubTodo> controllableSubTodos;
  final ValueChanged<ControllableSubTodo> onCheckPressed;
  final ValueChanged<SubTodo> onCreateNewItem;
  final ValueChanged<SubTodo> onDeleteItem;

  const SubTodoList({
    required this.controllableSubTodos,
    required this.onCheckPressed,
    required this.onCreateNewItem,
    required this.onDeleteItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controllableSubTodos.map((e) {
        return SubTodoItem(
          controllableSubTodo: e,
          onCheckPressed: () => onCheckPressed(e),
          onCreateNewItem: () => onCreateNewItem(e.subTodo),
          onDeleteItem: () => onDeleteItem(e.subTodo),
        );
      }).toList(),
    ).pOnly(top: topMarginValue);
  }
}
