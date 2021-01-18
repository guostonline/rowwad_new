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
}

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
}

playAudio(String audio) {
  audioCache.clear(audio);
  audioCache.play(audio);
}

showDialogue(context,
    {String image, String title, String description, bool isAnswerTrue}) {
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
              "السؤال التالي",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onOkButtonPressed: () {
              _controller.increment();
              _controller.inicialise();
              Navigator.pop(context);
            },
          ));
}
