import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz/Fonctions/GetXfunctions.dart';
import 'package:quiz/Fonctions/MyFunctions.dart';
import 'package:quiz/Fonctions/SaveInformation.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'package:quiz/Widgets/HeaderWidget.dart';
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
  var box = GetStorage();
  @override
  void initState() {
    super.initState();
    print(readInformation("questionIndex"));
    if (readInformation("questionIndex") != null) {
      _controller.questionIndex.value = readInformation("questionIndex") + 1;
    } else
      _controller.questionIndex.value = 0;
  }

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
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: circleProgress(
                            progressValue: moyenOfStage(
                                _controller.questionIndexStage.value,
                                _controller.bonReponceStage.value,
                                true),
                            title: "المعدل",
                            desc: moyenOfStage(
                                    _controller.questionIndexStage.value,
                                    _controller.bonReponceStage.value,
                                    false)
                                .toStringAsFixed(1)),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          normalProgress(
                              progressValue: 0.5,
                              title:
                                  "الاجوبة الصحيحة : ${_controller.bonReponceStage.value} المرحلة : ${_controller.stage.value}"),
                          SizedBox(height: 5),
                          normalProgress(
                              progressValue: 0.5,
                              title:
                                  "الاجوبة الصحيحة : ${_controller.bonReponceStage.value} المرحلة : ${_controller.stage.value}"),
                        ],
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: circleProgress(
                            progressValue: moyenOfStage(
                                _controller.questionIndexStage.value, 10, true),
                            title: "السؤال",
                            desc: _controller.questionIndexStage.value
                                .toString()),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  selectWidget(question[_controller.questionIndex.value].type),
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
            )));
      },
    ));
  }
}
