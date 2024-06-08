import 'package:adv_basics/colors.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.chosenAnswers, required this.restartQuiz, super.key});

  final List<String> chosenAnswers;

  final Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaries = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaries.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }

    return summaries;
  }

  int numCorrectAnswers(summaries) {
    return summaries
        .where((s) {
          return s['user_answer'] == s['correct_answer'];
        })
        .toList()
        .length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summaries = getSummaryData();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered ${numCorrectAnswers(summaries)} out of ${questions.length} questions correctly",
              style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            QuestionsSummary(summaries),
            const SizedBox(height: 35),
            TextButton.icon(
              onPressed: restartQuiz,
              label: Text("Repeat quiz",
                  style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              icon: const Icon(
                Icons.refresh,
                color: lighterLagoon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
