import 'package:do_what_to_do/common/data/local/app_database.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/features/todos/s_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: const TodosScreen(),
      ),
    );
  }
}
