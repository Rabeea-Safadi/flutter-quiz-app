import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  const ResultsScreen({
    required this.restartQuiz,
    required this.selectedAnswers,
    super.key,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You answered X out of Y questions correctly!'),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: restartQuiz,
                child: const Text('Restart Quiz!'),
              ),
            ],
          ),
        ));
  }
}
