import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/colors.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {
      switchScreen(toResultsScreen: true);
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void restartQuiz() {
    selectedAnswers = [];
    switchScreen();
  }

  void switchScreen({toResultsScreen}) {
    setState(() {
      if (toResultsScreen == true) {
        activeScreen = ResultsScreen(
            chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
      } else {
        activeScreen = QuestionsScreen(
          onSelectAnswer: chooseAnswer,
        );
      }
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
          backgroundColor: darkerLagoon,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lightLagoon,
                darkLagoon,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
