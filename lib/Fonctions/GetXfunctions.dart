import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Models/QuestionModel.dart';
import 'Verification.dart';
import 'MyFunctions.dart';

class GetXFunctions extends GetxController {
  // Opacity level
  RxDouble btn1Visible = 1.0.obs;
  RxDouble btn2Visible = 1.0.obs;
  RxDouble btn3Visible = 1.0.obs;
  RxDouble btn4Visible = 1.0.obs;
  // Colors level
  var colorButton = Colors.blue.withOpacity(0.5).obs;

  RxInt questionIndex = 0.obs;
  RxInt questionIndexStage = 1.obs;

  RxInt bonReponce = 0.obs;
  RxInt bonReponceStage = 0.obs;
  RxInt totalReponce = 0.obs;
  RxInt totalBonReponce = 0.obs;
  RxDouble moyenStage = 0.0.obs;
  RxDouble moyenGlobale = 0.0.obs;
  RxInt remumberIndex = 0.obs;
  RxInt remumberBonReponce = 0.obs;
  RxString stage = "الاولى".obs;
  RxBool isWin = false.obs;

  List<QuestionModel> questions = [];
  buttonsVisibility(int buttonNumber) {
    // Animation buttons
    switch (buttonNumber) {
      case 1:
        btn1Visible.value = 1.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 0.0;
        break;
      case 2:
        btn1Visible.value = 0.0;
        btn2Visible.value = 1.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 0.0;
        break;
      case 3:
        btn1Visible.value = 0.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 1.0;
        btn4Visible.value = 0.0;
        break;
      case 4:
        btn1Visible.value = 0.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 1.0;
        break;
      default:
    }
  }

  RxDouble buttonsCheker(int button) {
    switch (button) {
      case 1:
        return btn1Visible;
        break;
      case 2:
        return btn2Visible;
        break;
      case 3:
        return btn3Visible;
        break;
      case 4:
        return btn4Visible;
        break;
      default:
    }

    // return result;
  }

  incrementGlobale() => questionIndex++;

  inicialise() {
    btn1Visible.value = 1.0;
    btn2Visible.value = 1.0;
    btn3Visible.value = 1.0;
    btn4Visible.value = 1.0;
    colorButton.value = Colors.blue.withOpacity(0.5);
  }

  checkFuction(context, int userReponce) {
    // todo: work here
    Timer(Duration(seconds: 1), () {
      Verification().goodResponce(userReponce, questions[questionIndex.value].bonReponce)?
        goodReponceFunction(context, true)
      : goodReponceFunction(context, false);
      }
      if (Verification().newStageVerification(
          stage.value, questions[questionIndex.value].stage)) {
        Verification().moyenIsMoreThan5(
                questionIndexStage.value, bonReponceStage.value)
            ? newStageFunction(context, true)
            : newStageFunction(context, false);
      }
    });
  }

  goodReponceFunction(context, bool isGoodReponce) {
    if (isGoodReponce) {
      playAudio("win.wav");
      showDialogue(context,
          isQuestion: true,
          image: questions[questionIndex.value].image,
          title: "ممتاز جواب صحيح",
          description: questions[questionIndex.value].info, myFunction: () {
        bonReponce++;
        questionIndex++;
        questionIndexStage++;
        bonReponceStage++;
        inicialise();
        print("good answer $bonReponce $questionIndex");
      });
    } else {
      playAudio("lost.wav");
      showDialogue(context,
          isQuestion: true,
          image: questions[questionIndex.value].image,
          title: "للأسف الجواب خاطئ",
          description: questions[questionIndex.value].info, myFunction: () {
        questionIndex++;
        questionIndexStage++;

        inicialise();
        print("bed answer $bonReponce $questionIndex");
      });
    }
  }

  newStageFunction(context, bool isMoyen5) {
    if (isMoyen5) {
      messageGrade(context, questions[questionIndex.value].stage);
      bonReponce++;
      questionIndex++;
      stage.value = questions[questionIndex.value].stage;
      remumberIndex.value = questionIndex.value;
      questionIndexStage.value = 1;
      bonReponceStage.value = 0;
      remumberBonReponce.value = bonReponce.value;
      inicialise();
    } else {
      messageGrade(context, "fail");
      questionIndex.value = remumberIndex.value;
      questionIndexStage.value = 1;
      bonReponce.value = remumberBonReponce.value;
      bonReponceStage.value = 0;
      inicialise();
    }
  }
}
