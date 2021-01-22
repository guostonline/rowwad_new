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
        if (snapshot.data == null)
          return Center(child: CircularProgressIndicator());
        List<QuestionModel> question = parseJson(snapshot.data.toString());
        _controller.questions = question;
        return Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
                child: Obx(
              () => Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: myProgressBarGlobale(
                              value: 0.25,
                              questionStage:
                                  _controller.questionIndexStage.value - 1,
                              bonReponceStage:
                                  _controller.bonReponceStage.value,
                              questionGlobale: _controller.questionIndex.value,
                              bonReponceGlobale: _controller.bonReponce.value),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: myProgressBarStage(
                                question: _controller.questionIndexStage.value,
                                stage: _controller.stage.value,
                                bonReponce: _controller.bonReponceStage.value,
                                value: 0.5)),
                      ],
                    ),
                    SizedBox(height: 15),
                    selectWidget(
                        question[_controller.questionIndex.value].type),
                    SizedBox(height: 15),
                    Expanded(
                      flex: 7,
                      child: Container(
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
              ),
            )));
      },
    ));
  }
}
