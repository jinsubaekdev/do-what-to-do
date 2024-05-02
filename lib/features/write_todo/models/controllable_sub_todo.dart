import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:flutter/material.dart';

class ControllableSubTodo {
  SubTodo subTodo;
  final TextEditingController controller;
  final FocusNode focusNode;

  ControllableSubTodo({
    required this.subTodo,
    required this.controller,
    required this.focusNode,
  });

  factory ControllableSubTodo.fromSubTodo(SubTodo subTodo) {
    return ControllableSubTodo(
      subTodo: subTodo,
      controller: TextEditingController()..text = subTodo.title,
      focusNode: FocusNode(),
    );
  }

  SubTodo combineSubTodoWithController() {
    return subTodo.copyWith(title: controller.value.text);
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
