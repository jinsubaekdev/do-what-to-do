import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/common/widgets/w_todo_item.dart';
import 'package:do_what_to_do/features/todos/duymmy_todos.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('무슨 일을 하실건가요?').text.textStyle(AppTextTheme.displayXs.semiBold).make(),
              ...dummyTodos.map((e) => TodoItem(e, onCheckPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
