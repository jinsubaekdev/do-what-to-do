import 'package:do_what_to_do/features/todos/models/vo_sub_todo.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';

final dummyTodos = <Todo>[_todo1, _todo2, _todo3, _todo4];

void main() {
  for (var todo in dummyTodos) {
    print('Todo: ${todo.title}');
    print('Description: ${todo.description ?? 'No description'}');
    print('Is Complete: ${todo.isComplete ? 'Yes' : 'No'}');
    if (todo.subTodos.isNotEmpty) {
      print('Sub Todos:');
      for (var subTodo in todo.subTodos) {
        print('- ${subTodo.title} (${subTodo.isComplete ? 'Completed' : 'Pending'})');
      }
    }
    print('----------------------------');
  }
}

final _todo1 = Todo(
  title: 'Buy groceries',
  isComplete: false,
  description: 'Buy vegetables and fruits for the week.',
  subTodos: [
    SubTodo(title: 'Carrots', isComplete: false),
    SubTodo(title: 'Apples', isComplete: false),
    SubTodo(title: 'Milk', isComplete: true),
  ],
);

final _todo2 = Todo(
  title: 'Clean the house',
  isComplete: true,
  description: 'Vacuum and mop all rooms.',
  subTodos: [
    SubTodo(title: 'Living room', isComplete: true),
    SubTodo(title: 'Kitchen', isComplete: true),
    SubTodo(title: 'Bedrooms', isComplete: true),
  ],
);

final _todo3 = Todo(
  title: 'Prepare for presentation',
  isComplete: false,
  description: 'Create slides and practice speech.',
  subTodos: [
    SubTodo(title: 'Outline slides', isComplete: true),
    SubTodo(title: 'Practice speech', isComplete: false),
  ],
);

final _todo4 = Todo(
  title: 'Exercise',
  isComplete: false,
  description: 'Go for a run or do some yoga.',
  subTodos: [
    SubTodo(title: 'Run 5 km', isComplete: false),
    SubTodo(title: 'Yoga for 30 minutes', isComplete: false),
  ],
);
