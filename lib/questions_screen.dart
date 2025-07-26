import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer,{super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex=0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currQuestion=questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child:  Container(
        margin: EdgeInsets.all(40),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currQuestion.text,
          style: GoogleFonts.saira(
            color:Colors.white,
            fontSize:24,
            fontWeight:FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30,),
        ...currQuestion.getShuffledAnswers().map((answer){
          return AnswerButton(answer, (){answerQuestion(answer);});
        }),
      ],
    ),
    ),
    );
  }
}
