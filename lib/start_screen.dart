import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Opacity(
            opacity: 0.4,
            child:Image.asset(
              'assets/images/img.png',
              width: 500,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              "Learn Flutter the fun way!",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(onPressed: widget.startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.keyboard_arrow_right_rounded),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
