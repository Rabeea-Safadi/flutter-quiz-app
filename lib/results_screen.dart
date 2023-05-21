import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    var summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final totalCorrectQuestions = summaryData.where((data) {
      return data['answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $totalCorrectQuestions out of $totalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: restartQuiz,
                child: TextButton.icon(
                  label: const Text('Restart Quiz!'),
                  icon: const Icon(Icons.restart_alt),
                  onPressed: restartQuiz,
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
