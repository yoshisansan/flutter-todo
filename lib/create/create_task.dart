import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _CreateTask createState() => _CreateTask();
}

class _CreateTask extends State<CreateTask> {
  String _todoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CreateTask"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_todoText, style: TextStyle(color: Colors.blue)),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _todoText = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_todoText);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // キャンセルボタン
                child: TextButton(
                  // ボタンをクリックした時の処理
                  onPressed: () {
                    // "pop"で前の画面に戻る
                    Navigator.of(context).pop();
                  },
                  child: Text('キャンセル'),
                )),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
              },
              child: Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
