import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key})
      : mainColor = const Color.fromARGB(255, 255, 208, 0),
        secondaryColor = const Color.fromARGB(255, 209, 143, 0);

  final Color mainColor;
  final Color secondaryColor;

  void startQuiz() {}

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: mainColor,
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          Text(
            "Are you ready for the quiz? ",
            style: TextStyle(
              color: secondaryColor,
              fontSize: 30,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(20),
            ),
            label: const Text("Start"),
            icon: const Icon(Icons.start),
          ),
        ],
      ),
    );
  }
}