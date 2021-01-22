import 'package:get/get.dart';

import 'GetXfunctions.dart';

GetXFunctions _controller = Get.put(GetXFunctions());

class Verification {
  var context;
  String userAnswer;
  String goodAnswer;

  bool goodResponce(int userAnswer, int goodAnswer) {
    if (userAnswer == goodAnswer) return true;
    return false;
  }

  bool newStageVerification(String oldStage, String newStage) {
    if (oldStage != newStage) return true;
    return false;
  }

  bool moyenIsMoreThan5(int totalQuestionOfStage, int bonReponce) {
    if (((bonReponce / totalQuestionOfStage) * 10) >= 5.0) return true;
    return false;
  }
}
