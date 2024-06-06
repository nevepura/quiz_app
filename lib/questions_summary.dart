import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color calcColor(correctAns, userAns) {
    if (correctAns != userAns) {
      return Colors.red;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                const SizedBox(height: 100),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: CircleAvatar(
                    backgroundColor:
                        calcColor(data['correct_answer'], data['user_answer']),
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
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
                        color: Color.fromARGB(255, 70, 168, 248),
                      ),
                    ),
                  ],
                ))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
