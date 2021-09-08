import 'package:flutter/material.dart';
import 'create/create_task.dart';
import 'list/todo_list.dart';
import 'edit/edit.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // リスト一覧画面を表示
        home: TodoLists(),
        routes: {
          '/create_task': (context) => CreateTask(),
          '/todo_list': (context) => TodoLists(),
          '/edit': (context) => EditTask(),
        });
  }
}

// リスト一覧画面用Widget
// class TodoListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('リスト一覧画面'),
//       ),
//     );
//   }
// }
