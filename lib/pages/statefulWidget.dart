import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            '현재 숫자: $_counter',
          ),
          onPressed: () {
            setState(() {
              // setState() 추가.
              _counter++;
            });
          },
        ),
      ),
    );
  }
}
