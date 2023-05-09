import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/views/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF40B7AD);
    const textColor = Color(0xFF4a4a4a);
    const backgroundColor = Color(0xFFF5F5F5);
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: textColor,
          displayColor: textColor,
        )
      ),
      home: const SplashView(),
    );
  }
}
