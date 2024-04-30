import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/common/widgets/w_todo_list.dart';
import 'package:do_what_to_do/common/widgets/w_width_and_height.dart';
import 'package:do_what_to_do/features/write_todo/s_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => WriteTodoScreen.navigate(context: context),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              height16,
              Expanded(child: TodoList()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Text('할 일을 작성해주세요').text.textStyle(AppTextTheme.displayXs.semiBold).make();
  }
}
