import 'dart:convert';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'package:quiz/Widgets/MyWidgts.dart';

import 'GetXfunctions.dart';

AudioPlayer audioPlayer = AudioPlayer();
AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
GetXFunctions _controller = Get.put(GetXFunctions());
List<QuestionModel> question = [];
List<QuestionModel> parseJson(String responce) {
  if (responce == null) return [];
  final parsed = json.decode(responce.toString()).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionModel>((json) => new QuestionModel.fromJson(json))
      .toList();
} // 'parse json from local file

Widget selectWidget(String widgetName) {
  switch (widgetName) {
    case "image":
      return myQuestionImage(
        image: _controller.questions[_controller.questionIndex.value].file,
        question:
            _controller.questions[_controller.questionIndex.value].question,
      );
      break;
    case "question":
      return myQuestionText(
        question:
            _controller.questions[_controller.questionIndex.value].question,
      );
      break;
    case "audio":
      return myAudioQuestion(
        question:
            _controller.questions[_controller.questionIndex.value].question,
        audio: _controller.questions[_controller.questionIndex.value].file,
      );
      break;

    default:
      return null;
  }
} // select wath widget to show on quesionPage

playAudio(String audio) {
  audioCache.clear(audio);
  audioCache.play(audio);
} // function to listen to audio

showDialogue(context,
    {String image,
    String title,
    String description,
    Function myFunction,
    @required bool isQuestion}) {
  showDialog(
      context: context,
      builder: (_) => AssetGiffyDialog(
            cornerRadius: 20,
            image: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            description: Text(description,
                style: TextStyle(fontSize: 18),
                textDirection: TextDirection.rtl),
            entryAnimation: EntryAnimation.BOTTOM_RIGHT,
            onlyOkButton: true,
            buttonOkText: Text(
              isQuestion ? "السؤال التالي" : "المرحلة القادمة",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onOkButtonPressed: () {
              myFunction();
              Navigator.pop(context);
            },
          ));
} // Message of answer

double moyenOfStage(int question, int bonReponce) {
  if (question == 0 && bonReponce == 0) return 0;
  double x = (bonReponce.toDouble() / question.toDouble()) * 10;
  _controller.moyenStage.value = x;
  return x;
}

messageGrade(context, String stage) {
  switch (stage) {
    case "الاولى":
      {
        showDialogue(
          context,
          image: "images/cup_winner1.jpg",
          title: "مبروك وسام: المغاربي الحر",
          description: "يمكنك الان المرور للمرحلة الثانية",
          isQuestion: false,
          myFunction: () => Navigator.pop(context),
        );
      }
      break;
    case "الثانية":
      {
        showDialogue(
          context,
          image: "images/cup_winner2.jpg",
          title: "مبروك وسام: المستمع الراقي",
          description: "يمكنك الان المرور للمرحلة الثانية",
          isQuestion: false,
          myFunction: () => Navigator.pop(context),
        );
      }
      break;
    case "الثالثة":
      {
        showDialogue(
          context,
          image: "images/cup_winner3.jpg",
          title: "مبروك وسام: عاشق الاعنية المغربية",
          description: "يمكنك الان المرور للمرحلة الثانية",
          isQuestion: false,
          myFunction: () => Navigator.pop(context),
        );
      }
      break;
    case "fail":
      {
        showDialogue(context,
            image: "images/fail.png",
            title: "للاسف لا يمكنك المرور للمرحلة القادمة",
            description: "معدل أجوبتك اقل من 5/10. حاول من جديد فهذه مجرد لعبة",
            isQuestion: false, myFunction: () {
          Navigator.pop(context);
        });
      }
      break;
  }
}

bool upGradeStage(context, String stageOld, String stageNew) {
  if (stageOld != stageNew) {
    if (_controller.moyenStage.value >= 5.0) {
      _controller.stage.value = stageNew;
      _controller.remumberIndex.value = _controller.questionIndex.value;
      _controller.questionIndexStage.value = 1;
      _controller.bonReponceStage.value = 0;
      _controller.remumberBonReponce.value = _controller.bonReponce.value;
      messageGrade(context, stageNew);
    } else {
      _controller.questionIndex.value = _controller.remumberIndex.value;
      _controller.stage.value =
          _controller.questions[_controller.questionIndex.value].stage;
      _controller.bonReponce.value = _controller.remumberBonReponce.value;
      messageGrade(context, "fail");
    }
    return true;
  }
  return false;
}
