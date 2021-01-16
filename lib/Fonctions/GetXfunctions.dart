import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:quiz/Models/QuestionModel.dart';

class GetXFunctions extends GetxController {
  // Opacity level
  RxDouble btn1Visible = 1.0.obs;
  RxDouble btn2Visible = 1.0.obs;
  RxDouble btn3Visible = 1.0.obs;
  RxDouble btn4Visible = 1.0.obs;
  // Colors level
  var colorButton = Colors.blue.withOpacity(0.5).obs;

  RxInt questionIndex = 0.obs;
  RxInt bonReponce = 0.obs;
  RxInt totalReponce = 0.obs;
  RxInt totalBonReponce = 0.obs;
  RxInt stage = 1.obs;

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
        return null;
    }

    // return result;
  }

  increment() => questionIndex++;

  inicialise() {
    btn1Visible.value = 1.0;
    btn2Visible.value = 1.0;
    btn3Visible.value = 1.0;
    btn4Visible.value = 1.0;
    colorButton.value = Colors.blue.withOpacity(0.5);
  }

  checkFuction(context, int reponce) {
    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
    Timer(Duration(seconds: 3), () {
      if (reponce == questions[questionIndex.value].bonReponce) {
        bonReponce++;
        showDialogue(
          context,
          image: questions[questionIndex.value].image,
          title: 'رائع جواب صحيح',
          description: questions[questionIndex.value].info,
        );
        try {
          // audioPlayer.play('winning.mp3');
          audioCache.play('win.wav');
        } catch (e) {
          print(e);
        }
      } else
        showDialogue(
          context,
          image: questions[questionIndex.value].image,
          title: 'للاسف الجواب خاطئ',
          description: questions[questionIndex.value].info,
        );
      try {
        // audioPlayer.play('wrong.mp3');
        audioCache.play('lost.wav');
      } catch (e) {
        print(e);
      }
    });
  }

  showDialogue(context, {String image, String title, String description}) {
    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              image: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              title: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              description: Text(description, textDirection: TextDirection.rtl),
              entryAnimation: EntryAnimation.BOTTOM_RIGHT,
              onlyOkButton: true,
              buttonOkText: Text(
                "السؤال التالي",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onOkButtonPressed: () {
                increment();
                inicialise();
                Navigator.pop(context);
              },
            ));
  }
}
