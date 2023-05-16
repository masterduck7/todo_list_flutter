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
        children: const [
          _Header(),
          Expanded(child: _TaskList())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => const _NewTaskModal()
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  const _NewTaskModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextTitle(text: "New Task"),
          const SizedBox(height: 26),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: "Task description",
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
              onPressed: (){},
              child: const Text("Save")
          ),
        ],
      ),
    );
  }
}


class _TaskList extends StatefulWidget {
  const _TaskList({
    super.key,
  });

  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final taskList = <Task>[
    Task("Task 1"),
    Task("Task 2"),
    Task("Task 3"),
    Task("Task 4"),
    Task("Task 5"),
    Task("Task 6"),
    Task("Task 7"),
    Task("Task 8"),
    Task("Task 9"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitle(text: "Tasks"),
          const SizedBox(height: 13),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 0),
              itemCount: taskList.length,
                separatorBuilder: (_ ,__) => const SizedBox(height: 21),
                itemBuilder: (_, index) => _TaskItem(taskList[index], onTap: () {
                  taskList[index].done = !taskList[index].done;
                  setState(() {});
                },),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap }) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary
              ),
              const SizedBox(width: 12),
              Text(task.title),
            ],
          ),
        )
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const TextTitle(text: 'Complete your tasks', color: Colors.white),
              const SizedBox(height: 32),
            ],
          )
        ],
      ),
    );
  }
}
