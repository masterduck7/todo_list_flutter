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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                  itemCount: taskList.length,
                  separatorBuilder: (_ ,__) => const SizedBox(height: 16),
                  itemBuilder: (_, index) => _TaskItem(taskList[index]),
              ),
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

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        child: Row(
          children: [
            Icon(
              Icons.check_box_outline_blank,
              color: Theme.of(context).colorScheme.primary
            ),
            const SizedBox(width: 12),
            Text(task.title),
          ],
        ),
      )
    );
  }
}

final taskList = [
  Task("Task 1"),
  Task("Task 2"),
  Task("Task 3"),
  Task("Task 1"),
  Task("Task 2"),
  Task("Task 3"),
];