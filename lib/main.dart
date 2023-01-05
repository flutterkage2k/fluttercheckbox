import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _checked = [false, false, false, false, false, false, false];
  List<String> _days = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checked box'),
      ),
      body: Column(children: [
        for (int i = 0; i < _checked.length; i++)
          _myCheckBox(_checked[i], _days[i], i),
        // Text('Check box is result : \n${_result()}'),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.amberAccent,
              backgroundColor: Colors.pinkAccent),
          onPressed: () {
            if (_checked.asMap().values.contains(false)) {
              return userShowSnackBar();
            }
          },
          child: Text("null check"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("next page"),
        ),
      ]),
    );
  }

  Widget _myCheckBox(bool check, String title, int index) {
    return Row(
      children: [
        Checkbox(
            value: check,
            onChanged: (val) {
              setState(() {
                _checked[index] = val!;
              });
            }),
        Text(title),
      ],
    );
  }

  String _result() {
    String result = "";
    for (int i = 0; i < _checked.length; i++) {
      if (_checked[i]) result += "${_checked[i]} \n";
    }
    return result;
  }

  void userShowSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("체크박스가 모두 선택되지 않았습니다.")));
  }
}
