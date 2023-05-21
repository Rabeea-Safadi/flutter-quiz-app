import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: summary['answer'] == summary['correct_answer']
                        ? const Color.fromARGB(255, 77, 172, 168)
                        : const Color.fromARGB(255, 235, 90, 80),
                  ),
                  child: Text(
                    ((summary['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          summary['question'] as String,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          summary['answer'] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(135, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          summary['correct_answer'] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(200, 0, 208, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
