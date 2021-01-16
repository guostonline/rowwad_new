import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Fonctions/GetXfunctions.dart';
import 'package:quiz/Fonctions/MyFunctions.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'package:quiz/Widgets/MyWidgts.dart';

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

        _controller.questions = question;

        return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
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
                    child: selectWidget(
                        question[_controller.questionIndex.value].type),
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
                              context: context,
                              text: question[_controller.questionIndex.value]
                                  .reponce_1,
                              question: 1),
                          myButtonRaisen(
                              context: context,
                              text: question[_controller.questionIndex.value]
                                  .reponce_2,
                              question: 2),
                          myButtonRaisen(
                              context: context,
                              text: question[_controller.questionIndex.value]
                                  .reponce_3,
                              question: 3),
                          myButtonRaisen(
                              context: context,
                              text: question[_controller.questionIndex.value]
                                  .reponce_4,
                              question: 4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
      },
    ));
  }
}
