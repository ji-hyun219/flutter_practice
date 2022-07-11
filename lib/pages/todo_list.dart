// 1. Todo 클래스 정의
// 우선 Todo 를 표현하기 위한 간단한 정보가 필요합니다.
// 이 예제에서는 두 가지의 데이터를 갖고 있는 클래스를 정의할 것입니다.
// 제목, 상세설명
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

// 2. Todo 리스트를 보여줍니다.
// 이 예제에서는 20개의 todo 를 생성하고 ListView 를 사용하여 보여줄 것
// final todos = List<Todo>.generate(length, (index) => null)
final todos = List<Todo>.generate(
  20,
  (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i',
  ),
);

// 2. ListView 를 사용하여 Todo 리스트 보여주기
// 4. 상세 화면으로 이동하면서 데이터를 전달합니다.
class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo')),
        body: Container(
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => DetailScreen(todo: todos[index])),
                    // );
                    Get.to(() => DetailScreen(todo: todos[index]));
                  },
                );
              }),
        ));
  }
}

// 3. Todo 에 대한 상세 정보를 보여줄 수 있는 화면을 생성합니다.

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(todo.description),
        ));
  }
}
