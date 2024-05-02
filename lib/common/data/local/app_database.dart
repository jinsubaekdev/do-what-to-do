import 'package:do_what_to_do/common/data/local/collections/todo_db_model.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  static late final Isar _isar;

  AppDatabase._();

  static AppDatabase instance = AppDatabase._();

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TodoDbModelSchema],
      directory: dir.path,
    );
  }

  Future<List<Todo>> getAllTodos() async {
    try {
      final models = await _isar.todoDbModels.where().findAll();
      return models.map((e) => e.toEntity()).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addOrUpdateTodo(Todo todo) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.todoDbModels.put(todo.toDbModel());
      });
    } catch (e) {}
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.todoDbModels.delete(todo.toDbModel().isarId);
      });
    } catch (e) {}
  }
}
