import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  final String? param;
  EditTask({Key? key, this.param}) : super(key: key);

  @override
  _EditTask createState() => _EditTask(param);
}

class _EditTask extends State<EditTask> {
  final String? param;
  _EditTask(this.param);
  String _todoText = '';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(param);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Edit Task'),
          ),
          body: Container(
              padding: EdgeInsets.all(64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(param ?? ''),
                  TextFormField(
                    initialValue: param,
                    onChanged: (String value) {
                      setState(() {
                        _todoText = value;
                      });
                    },
                  ),
                  TextButton(
                    // ボタンをクリックした時の処理
                    onPressed: () {
                      // "pop"で前の画面に戻る
                      Navigator.of(context).pop(_todoText);
                    },
                    child: Text('編集する'),
                  ),
                  TextButton(
                    // ボタンをクリックした時の処理
                    onPressed: () {
                      // "pop"で前の画面に戻る
                      Navigator.of(context).pop(param);
                    },
                    child: Text('編集せずに戻る'),
                  ),
                ],
              )),
        ));
  }
}
