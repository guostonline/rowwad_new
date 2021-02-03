import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:quiz/Fonctions/GetXfunctions.dart';
import "package:quiz/Fonctions/MyFunctions.dart";

//GetXFunctions _controller = Get.put(GetXFunctions());

Widget myQuestionImage({String question, String image}) {
  return Container(
    width: double.infinity,
    height: 250,
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
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
