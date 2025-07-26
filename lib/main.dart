import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  Widget? activeScreen ;

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    print(selectedAnswers);

    if(selectedAnswers.length == questions.length){
      setState(() {
        selectedAnswers=[];
        activeScreen=ResultScreen(selectedAnswers);
      });
    }
  }

  @override
  void initState() {
    activeScreen=StartScreen(changeScreen);
    super.initState();
  }

  void changeScreen(){
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255,24,188,253),
        body: activeScreen,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
