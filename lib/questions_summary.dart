import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color calcColor(userAnswer) {
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            const SizedBox(height: 100),
            Text(((data['question_index'] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['user_answer'] as String,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
