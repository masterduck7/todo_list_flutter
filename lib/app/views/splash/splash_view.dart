import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/views/components/text_title.dart';
import 'package:todo_list_flutter/app/views/components/vector.dart';
import 'package:todo_list_flutter/app/views/task_list/task_list_view.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});

  @override
  Widget build( context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Vector()
            ],
          ),
          const SizedBox(height: 73),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(height: 99),
          const TextTitle(text: 'Lista de Tareas'),
          const SizedBox(height: 21),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const TaskListView();
                  })
              );
              },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

}