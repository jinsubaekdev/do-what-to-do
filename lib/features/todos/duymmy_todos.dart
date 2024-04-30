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
  id: '100',
  title: 'Buy groceries',
  isComplete: false,
  description: 'Buy vegetables and fruits for the week.',
  subTodos: [
    SubTodo(id: '1', title: 'Carrots', isComplete: false),
    SubTodo(id: '2', title: 'Apples', isComplete: false),
    SubTodo(id: '3', title: 'Milk', isComplete: true),
  ],
);

final _todo2 = Todo(
  id: '200',
  title: 'Clean the house',
  isComplete: true,
  description: 'Vacuum and mop all rooms.',
  subTodos: [
    SubTodo(id: '4', title: 'Living room', isComplete: true),
    SubTodo(id: '5', title: 'Kitchen', isComplete: true),
    SubTodo(id: '6', title: 'Bedrooms', isComplete: true),
  ],
);

final _todo3 = Todo(
  id: '300',
  title: 'Prepare for presentation',
  isComplete: false,
  description: 'Create slides and practice speech.',
  subTodos: [
    SubTodo(id: '7', title: 'Outline slides', isComplete: true),
    SubTodo(id: '8', title: 'Practice speech', isComplete: false),
  ],
);

final _todo4 = Todo(
  id: '400',
  title: 'Exercise',
  isComplete: false,
  description: 'Go for a run or do some yoga.',
  subTodos: [
    SubTodo(id: '9', title: 'Run 5 km', isComplete: false),
    SubTodo(id: '10', title: 'Yoga for 30 minutes', isComplete: false),
  ],
);
