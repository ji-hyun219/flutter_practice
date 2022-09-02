import 'package:flutter/material.dart';

import './archive.dart';

// This screen only displays un-completed tasks
class HomePage extends StatelessWidget {
  // Using "static" so that we can easily access it from other screens
  // static:
  // 1. 인스턴스에 귀속되지 않고, 클래스 통째로 귀속 되는 것
  // 2. 함수 또는 변수가 통째로 클래스에 귀속 되는 것
  static final ValueNotifier<List<Map<String, dynamic>>> tasksNotifier =
      ValueNotifier([]);

  const HomePage({Key? key}) : super(key: key);

  // This function will be triggered when the floating button is pressed
  // Add new task
  void _addNewTask() {
    final List<Map<String, dynamic>> tasks = [...tasksNotifier.value];
    tasks.add({
      "id": DateTime.now().toString(),
      "title": "Task ${DateTime.now()}",
      "isDone": false
    });
    tasksNotifier.value = tasks;

    /*
  얖은 복사와 깊은 복사 차이
  
  <얕은 복사>
  1. 객체를 복사할 때, 해당 객체만 복사하여 새 객체를 생성한다.
  2. 복사된 객체의 인스턴스 변수는 원복 객체의 인스턴스 변수와 같은 메모리 주소를 참조하며 
  해당 메모리 주소의 값이 변경되면 다른 객체의 변수 값 역시 동일하게 변경된다

  <깊은 복사>
  1. 객체를 복사할 때 해당 객체와 인스턴스 변수까지 복사한다
  2. 데이터 참조가 아닌 객체의 형태를 그대로 복사함으로써 한 객체가 변경되어도 다른 객체의 데이터에는 영향을 주지 않는다.

  */
  }

  // This function will be triggered when the checkbox next to a task is tapped
  // Finish a task
  // Change a task from "uncompleted" to "completed"
  void _finishTask(String updatedTaskId) {
    final List<Map<String, dynamic>> tasks = [...tasksNotifier.value];

    final int index = tasks.indexWhere((task) => task['id'] == updatedTaskId);
    tasks[index]['isDone'] = true;

    tasksNotifier.value = tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: HomePage.tasksNotifier,
        builder: (_, tasks, __) {
          final uncompletedTasks =
              tasks.where((task) => task['isDone'] == false).toList();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const ArchivePage(),
                      ));
                    },
                    child: const Text('View Completed Tasks')),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'You have ${uncompletedTasks.length} uncompleted tasks',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: uncompletedTasks.length,
                    itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 5,
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(uncompletedTasks[index]['title']),
                          trailing: IconButton(
                            icon: const Icon(Icons.check_box_outline_blank),
                            onPressed: () =>
                                _finishTask(uncompletedTasks[index]['id']),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
