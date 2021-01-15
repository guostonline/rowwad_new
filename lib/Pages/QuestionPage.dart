import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:quiz/Fonctions/MyFunctions.dart';
=======
import 'package:quiz/Fonctions/FunctionJson.dart';
>>>>>>> origin/main
import 'package:quiz/Fonctions/GetXfunctions.dart';
import 'package:quiz/Widgets/MyWidgts.dart';
import 'package:quiz/Models/QuestionModel.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

GetXFunctions _controller = Get.put(GetXFunctions());
int questionIndex = _controller.questionIndex.value;

class _QuestionPageState extends State<QuestionPage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("MyJson/Questions.json"),
      builder: (context, snapshot) {
        List<QuestionModel> question = parseJson(snapshot.data.toString());
<<<<<<< HEAD
        _controller.questions = question;
=======
>>>>>>> origin/main
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
<<<<<<< HEAD
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: myProgressBar(
                        question: _controller.questionIndex.value + 1,
                        stage: question[_controller.questionIndex.value].stage,
                        value: 0.5),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 4,
                    child: myQuestionText(
                        question[_controller.questionIndex.value].question),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          myButtonRaisen(
                              context,
                              question[_controller.questionIndex.value]
                                  .reponce_1,
                              1),
                          myButtonRaisen(
                              context,
                              question[_controller.questionIndex.value]
                                  .reponce_2,
                              2),
                          myButtonRaisen(
                              context,
                              question[_controller.questionIndex.value]
                                  .reponce_3,
                              3),
                          myButtonRaisen(
                              context,
                              question[_controller.questionIndex.value]
                                  .reponce_4,
                              4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
=======
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: myProgressBar(0.25, 5, 2),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 4,
                  child: myQuestionText(question[1].question),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        myButtonRaisen(question[1].reponce_1, 1),
                        myButtonRaisen(question[1].reponce_2, 2),
                        myButtonRaisen(question[1].reponce_3, 3),
                        myButtonRaisen(question[1].reponce_4, 4),
                      ],
                    ),
                  ),
                ),
              ],
>>>>>>> origin/main
            ),
          ),
        );
      },
    ));
  }
}
