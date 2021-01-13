import 'package:flutter/services.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'dart:convert';

List<QuestionModel> parseJson(String responce) {
  if (responce == null) return [];
  final parsed = json.decode(responce.toString()).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionModel>((json) => new QuestionModel.fromJson(json))
      .toList();
}
