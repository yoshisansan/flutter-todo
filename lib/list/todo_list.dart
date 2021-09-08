import 'package:flutter/material.dart';
import '../create/create_task.dart';
import '../edit/edit.dart';

class TodoLists extends StatefulWidget {
  @override
  _TodoListsState createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
  List<String?> todoList = [
    'aaa',
    'bbb',
    'ccc',
    'ddd',
    'eee',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task Lists'),
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(todoList[index] ?? ''),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            icon: Icon(Icons.edit_outlined),
                            onPressed: () async {
                              final rewriteTask = await Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return EditTask(param: todoList[index]);
                              }));
                              if (rewriteTask != todoList[index]) {
                                setState(() {
                                  todoList[index] = rewriteTask;
                                });
                              }
                            }),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              todoList.remove(todoList[index]);
                            });
                          },
                        )
                      ],
                    )),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // "push"で新規画面に遷移
            // リスト追加画面から渡される値を受け取る
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return CreateTask();
              }),
            );
            if (newListText != null) {
              // キャンセルした場合は newListText が null となるので注意
              setState(() {
                // リスト追加
                todoList.add(newListText);
              });
            }
          },
          child: Icon(Icons.add),
        ));
  }
}
