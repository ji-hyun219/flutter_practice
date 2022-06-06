import 'package:flutter/material.dart';

void main() {
  runApp(
    // runApp 다음에는 항상 MaterialApp 이 들어가야 한다.
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Hello World', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),),
        ),
      ),
    ),
  );
}
