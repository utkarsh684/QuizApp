import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer,{super.key});

  final List<String> choosenAnswer;

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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered X out of Y questions correctly'),
            SizedBox(
              height: 30,
            ),
            Text('List of answers and questions...'),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: (){}, child: Text('Restart Quiz'),),
          ],
        ),
      ),
    );
  }
}
