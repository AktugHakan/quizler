import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizler/widgets/text_styles.dart';
import '../question.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  const QuizPage({super.key, required this.questions});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<FaIcon> scoreCounter = [];
  int question_counter = 0;

  void answerTheQuestion(bool isCorrect) {
    if (!(question_counter + 2 > widget.questions.length)) {
      question_counter++;
      scoreCounter.add(
        isCorrect
            ? const FaIcon(
                FontAwesomeIcons.check,
                color: Colors.green,
              )
            : const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.red,
              ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
                child: Text(
              widget.questions[question_counter].questionText,
              style: textStyleQuestion,
            )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answerTheQuestion(
                        widget.questions[question_counter].answer);
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "True",
                  style: textStyleAnswer,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answerTheQuestion(
                        !widget.questions[question_counter].answer);
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "False",
                  style: textStyleAnswer,
                ),
              ),
            ),
          ),
          Row(
            children: scoreCounter,
          )
        ]);
  }
}
