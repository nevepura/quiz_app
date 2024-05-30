import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    var curQuestion = questions[0];

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
              curQuestion.text,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),
            ...curQuestion.answers.map((answer) {
              return AnswerButton(answerText: answer, onTap: () {});
            }),
            // An alternative way:
            /*
            for (var ans in curQuestion.answers)
              AnswerButton(
                answerText: ans,
                onTap: () {},
              )
            */
          ],
        ),
      ),
    );
  }
}
