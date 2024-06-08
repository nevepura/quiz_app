import 'package:adv_basics/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: darkYellow,
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          const Text(
            "Are you ready for the challenge? ",
            style: TextStyle(
              color: orange,
              fontSize: 30,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          ElevatedButton.icon(
            onPressed: switchScreen,
            style: ElevatedButton.styleFrom(
              backgroundColor: darkerLagoon,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
            ),
            label: Text("Start",
                style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            icon: const Icon(Icons.start),
          ),
        ],
      ),
    );
  }
}
