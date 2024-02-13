import 'package:flutter/material.dart';
import 'package:quizler/question.dart';
import 'package:quizler/widgets/quiz_page.dart';
import 'package:quizler/widgets/text_styles.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    const question_list = [
      Question(questionText: "Test q1 true", answer: true),
      Question(questionText: "Test q2 false", answer: false),
      Question(questionText: "Test q3 true", answer: true),
      Question(questionText: "Test q4 true", answer: true),
      Question(questionText: "Test q5 false", answer: false),
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: QuizPage(
              questions: question_list,
            ),
          ),
        ),
      ),
    );
  }
}
