import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:do_what_to_do/common/widgets/w_empty_expended.dart';
import 'package:do_what_to_do/common/widgets/w_width_and_height.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:do_what_to_do/features/todos/state/todo_data_holder.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_delete_button.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_mark_todo_button.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_save_button.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_todo_description_text_field.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_todo_title_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';

class WriteTodoScreen extends ConsumerStatefulWidget {
  final Todo? todo;

  const WriteTodoScreen({
    this.todo,
    super.key,
  });

  static void navigate({required BuildContext context, Todo? todo}) {
    Navigator.of(context).push(CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (context) => WriteTodoScreen(todo: todo),
    ));
  }

  @override
  ConsumerState<WriteTodoScreen> createState() => _WriteTodoScreenState();
}

class _WriteTodoScreenState extends ConsumerState<WriteTodoScreen> with AfterLayoutMixin {
  late Todo todo;

  final titleController = TextEditingController();
  final titleNode = FocusNode();
  final descriptionController = TextEditingController();
  final descriptionNode = FocusNode();

  @override
  void initState() {
    super.initState();
    todo = widget.todo ?? Todo(id: const Uuid().v4(), title: '');
    titleController.text = todo.title;
    descriptionController.text = todo.description ?? '';
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    titleNode.requestFocus();
  }

  @override
  void dispose() {
    titleNode.dispose();
    descriptionNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _TodoContainerLayout(
              child: Column(
                children: [
                  TodoTitleTextField(
                    focusNode: titleNode,
                    controller: titleController,
                    onChanged: onTitleChanged,
                    onEditingComplete: descriptionNode.requestFocus,
                    onClosePressed: () => Navigator.of(context).pop(),
                  ),
                  height16,
                  Expanded(
                    child: TodoDescriptionTextField(
                      focusNode: descriptionNode,
                      controller: descriptionController,
                      onChanged: onDescriptionChanged,
                      onActionPressed: takeActionOnDescription,
                    ),
                  ),
                ],
              ),
            ),
            _Footer(
              todo: todo,
              onDeletePressed: deleteTodo,
              onMarkPressed: toggleTodoStatus,
              onSavePressed: saveTodo,
            ),
          ],
        ),
      ),
    );
  }

  void onTitleChanged(String value) {
    setState(() {
      todo = todo.copyWith(title: value);
    });
  }

  void onDescriptionChanged(String value) {
    setState(() {
      todo = todo.copyWith(description: value);
    });
  }

  void takeActionOnDescription() {
    setState(() {
      todo = todo.copyWith(description: '${todo.description}\n');
    });
  }

  void deleteTodo() {
    ref.readTodoDataHolder.deleteTodo(todo);
    Navigator.of(context).pop();
  }

  void toggleTodoStatus() {
    setState(() {
      todo = todo.copyWith(isComplete: !todo.isComplete);
    });
  }

  void saveTodo() {
    ref.readTodoDataHolder.addOrUpdateTodo(todo);
    Navigator.of(context).pop();
  }
}

class _TodoContainerLayout extends StatelessWidget {
  static const topMargin = EdgeInsets.only(top: 16.0);

  final Widget child;
  const _TodoContainerLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: topMargin,
        padding: defaultPadding,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius32,
        ),
        child: child,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  static const hPadding = 16.0;
  static const vPadding = 12.0;

  final Todo todo;
  final VoidCallback onDeletePressed;
  final VoidCallback onMarkPressed;
  final VoidCallback onSavePressed;

  const _Footer({
    required this.todo,
    required this.onDeletePressed,
    required this.onMarkPressed,
    required this.onSavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DeleteButton(onPressed: onDeletePressed),
        width8,
        MarkTodoButton(
          value: todo.isComplete,
          onPressed: onMarkPressed,
        ),
        emptyExpanded,
        SaveButton(
          enabled: todo.title.isNotEmpty,
          onPressed: onSavePressed,
        ),
      ],
    ).pSymmetric(h: hPadding, v: vPadding);
  }
}
