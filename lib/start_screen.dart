import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.myFun, {super.key})
      : mainColor = const Color.fromARGB(255, 255, 208, 0),
        secondaryColor = const Color.fromARGB(255, 209, 143, 0);

  final Function() myFun;
  final Color mainColor;
  final Color secondaryColor;

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
            onPressed: myFun,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 24, 41, 49),
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
