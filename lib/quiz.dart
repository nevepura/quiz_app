import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Quiz app',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Quiz app"),
          ),
          backgroundColor: const Color.fromARGB(255, 24, 41, 49),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 89, 132, 145),
            Color.fromARGB(255, 59, 97, 109),
            Color.fromARGB(255, 42, 76, 87),
          ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
