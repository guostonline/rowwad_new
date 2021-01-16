import 'dart:convert';

import 'package:get/get.dart';
import 'package:quiz/Models/QuestionModel.dart';

import 'GetXfunctions.dart';

GetXFunctions _controller = Get.put(GetXFunctions());
List<QuestionModel> parseJson(String responce) {
  if (responce == null) return [];
  final parsed = json.decode(responce.toString()).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionModel>((json) => new QuestionModel.fromJson(json))
      .toList();
}
