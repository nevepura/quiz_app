import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({required this.chosenAnswers, super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> summaries = [];

  List<Map<String, Object>> getSummaryData() {
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

  int numCorrectAnswers() {
    return summaries
        .where((s) {
          return s['user_answer'] == s['correct_answer'];
        })
        .toList()
        .length;
  }

  @override
  Widget build(BuildContext context) {
    summaries = getSummaryData();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "You answered ${numCorrectAnswers()} out of ${questions.length} questions correctly",
                style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              QuestionsSummary(summaries),
              const SizedBox(height: 35),
              TextButton(
                onPressed: () {},
                child: Text("Repeat quiz",
                    style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              )
            ]),
      ),
    );
  }
}
