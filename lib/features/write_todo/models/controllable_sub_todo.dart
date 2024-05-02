import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:flutter/material.dart';

class ControllableSubTodo {
  final TextEditingController controller;
  final FocusNode focusNode;

  SubTodo _subTodo;
  SubTodo get subTodo => _subTodo.copyWith(title: controller.text);

  ControllableSubTodo({
    required SubTodo subTodo,
    required this.controller,
    required this.focusNode,
  }) : _subTodo = subTodo;

  factory ControllableSubTodo.fromSubTodo(SubTodo subTodo) {
    return ControllableSubTodo(
      subTodo: subTodo,
      controller: TextEditingController()..text = subTodo.title,
      focusNode: FocusNode(),
    );
  }

  factory ControllableSubTodo.empty() {
    return ControllableSubTodo.fromSubTodo(SubTodo.empty());
  }

  void toggleState() {
    _subTodo = _subTodo.copyWith(isComplete: !_subTodo.isComplete);
  }

  SubTodo combineSubTodoWithController() {
    return subTodo.copyWith(title: controller.value.text);
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
