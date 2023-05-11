import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/model/task.dart';
import 'package:todo_list_flutter/app/views/components/text_title.dart';
import 'package:todo_list_flutter/app/views/components/vector.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                Row(children: const [Vector()]),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    const TextTitle(text: 'Completa tus tareas', color: Colors.white),
                    const SizedBox(height: 32),
                  ],
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 25),
              child: TextTitle(text: 'Tareas')
          ),
          Expanded(
            child: ListView.separated(
                itemCount: taskList.length,
                separatorBuilder: (a,b) => const SizedBox(height: 16),
                itemBuilder: (_, index) => Text(taskList[index].title),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }
}

final taskList = [
  Task("Task 1"),
  Task("Task 2"),
  Task("Task 3"),
];