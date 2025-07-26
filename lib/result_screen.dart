import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer,this.onRestart,{super.key});

  final List<String> choosenAnswer;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData() {
    final List<Map<String,Object>> summary=[];

    for(int i=0;i<choosenAnswer.length;i++){
      summary.add({
        'questions_index':i,
        'questions':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswer[i]
      },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    int totalQuestions=questions.length;
    int correctQuestions=summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered ${correctQuestions} out of ${totalQuestions} questions correctly'),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: onRestart, child: Text('Restart Quiz'),),
          ],
        ),
      ),
    );
  }
}
