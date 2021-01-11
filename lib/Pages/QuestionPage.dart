import 'package:flutter/material.dart';
import 'package:quiz/Widgets/MyWidgts.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: myProgressBar(0.25, 5, 2),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 4,
              child: myQuestionImage("من في الصورة", "arbi.jpg"),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: QuestionButtons(),
            ),
          ],
        ),
      ),
    ));
  }
}

class QuestionButtons extends StatelessWidget {
  const QuestionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          myButtonRaisen("Question 1", 1),
          myButtonRaisen("Question 2", 2),
          myButtonRaisen("Question 3", 3),
          myButtonRaisen("Question 4", 4),
        ],
      ),
    );
  }
}
