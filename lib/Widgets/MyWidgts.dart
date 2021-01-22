import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:quiz/Fonctions/GetXfunctions.dart';
import "package:quiz/Fonctions/MyFunctions.dart";

//GetXFunctions _controller = Get.put(GetXFunctions());
Widget myProgressBarStage({
  double value,
  int question,
  int bonReponce,
  String stage,
}) {
  return Container(
    // height: 100,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: LiquidLinearProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
      backgroundColor: Colors.grey,
      borderColor: Colors.white,
      borderWidth: 2.0,
      borderRadius: 20,
      direction: Axis.horizontal,
      center: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            AutoSizeText(
              "السؤال $question",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Divider(color: Colors.white),
            AutoSizeText(
              "أجوبة صحيحة $bonReponce من المرحلة $stage",
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget myProgressBarGlobale({
  double value,
  int questionStage,
  int bonReponceStage,
  int questionGlobale,
  int bonReponceGlobale,
}) {
  return Container(
    // height: 100,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: LiquidLinearProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
      backgroundColor: Colors.grey,
      borderColor: Colors.white,
      borderWidth: 2.0,
      borderRadius: 20,
      center: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              "معدل المرحلة : ${moyenOfStage(questionStage, bonReponceStage).toStringAsFixed(1)}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Divider(color: Colors.white),
            Text(
              "المعدل العام : ${moyenOfStage(questionGlobale, bonReponceGlobale).toStringAsFixed(1)}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}

//              "معدل المرحلة $stage ${moyenOfStage(question - 1, bonReponce).toStringAsFixed(1)}/10 المعدل العالم  $globale",
Widget myCircleProgressBar(int question, String stage) {
  return LiquidCircularProgressIndicator(
    borderColor: Colors.white,
    borderWidth: 2.0,
    center: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AutoSizeText("$question",
            minFontSize: 22, style: TextStyle(color: Colors.white)),
        Divider(color: Colors.white, indent: 5, endIndent: 5),
        AutoSizeText(" $stage", style: TextStyle(color: Colors.white))
      ],
    ),
  );
}

Widget myQuestionImage({String question, String image}) {
  return Container(
    width: double.infinity,
    height: 250,
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("$image"), fit: BoxFit.fill)),
    child: Container(
      color: Colors.black.withOpacity(0.5),
      child: Text(
        question,
        style: TextStyle(
          fontSize: 25,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget myQuestionText({String question}) {
  return Stack(
    children: <Widget>[
      Container(
        color: Colors.transparent,
        child: Image.asset("images/tv2.jpg"),
      ),
      Center(
        child: Container(
          width: 240,
          height: 180,
          margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 100),
          child: Center(
            child: Text(question,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
          ),
        ),
      )
    ],
  );
}

Widget myAudioQuestion({String question, String audio}) {
  playAudio(audio);
  return Stack(
    children: <Widget>[
      Container(
        child: Image.asset("images/k7.gif"),
      ),
      Positioned(
        top: 25,
        left: 10,
        right: 10,
        child: Container(
          child: Center(
              child: Text(
            question,
            style: TextStyle(fontSize: 25, color: Colors.black),
            textAlign: TextAlign.center,
          )),
        ),
      ),
      Positioned(
        top: 80,
        right: 45,
        child: IconButton(
          onPressed: () {
            playAudio(audio);
          },
          color: Colors.transparent,
          icon: Icon(
            Icons.replay,
            size: 45,
            color: Colors.blue,
          ),
        ),
      ),
      Positioned(
        top: 80,
        left: 45,
        child: IconButton(
          onPressed: () {},
          color: Colors.transparent,
          icon: Icon(
            Icons.play_arrow,
            size: 45,
            color: Colors.blue,
          ),
        ),
      ),
    ],
  );
}

Widget myButtonRaisen({context, String text, int question}) {
  GetXFunctions _controller = Get.put(GetXFunctions());
  return Obx(
    () => AnimatedOpacity(
      opacity: _controller.buttonsCheker(question).value,
      duration: Duration(milliseconds: 300),
      child: Container(
        height: 50,
        // padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: RaisedButton(
            color: _controller.colorButton.value,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.white, width: 2)),
            child: AutoSizeText(
              text,
              minFontSize: 18,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _controller.buttonsVisibility(question);
              _controller.colorButton.value = Colors.green;
              _controller.checkFuction(context, question);
            }),
      ),
    ),
  );
}
