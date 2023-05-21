import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((summary) {
        return Row(
          children: [
            Text(((summary['question_index'] as int) + 1).toString()),
            Column(
              children: [
                Text(summary['question'] as String),
                const SizedBox(height: 5),
                Text(summary['answer'] as String),
                Text(summary['correct_answer'] as String),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
