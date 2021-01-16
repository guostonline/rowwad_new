import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'package:quiz/Widgets/MyWidgts.dart';

import 'GetXfunctions.dart';

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
