import 'package:audioplayers/audio_cache.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:quiz/Fonctions/GetXfunctions.dart';
import 'package:audioplayers/audioplayers.dart';

Widget myProgressBar({double value, int question, String stage}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: LiquidLinearProgressIndicator(
      value: 0.5,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
      backgroundColor: Colors.grey,
      borderColor: Colors.white,
      borderWidth: 2.0,
      borderRadius: 20,
      direction: Axis
          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
      center: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "السؤال $question من المرحلة  $stage",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}

Widget myQuestionImage(String question, String image) {
  return Container(
    width: double.infinity,
    height: 250,
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/$image"), fit: BoxFit.fill)),
    child: Text(
      question,
      style: TextStyle(
          fontSize: 25,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          backgroundColor: Colors.black54),
      textAlign: TextAlign.center,
    ),
  );
}

Widget myQuestionText(String question) {
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

Widget myButtonRaisen(context, String text, int question) {
  GetXFunctions _controller = Get.put(GetXFunctions());
  return Obx(
    () => AnimatedOpacity(
      opacity: _controller.buttonsCheker(question).value,
      duration: Duration(milliseconds: 1000),
      child: Container(
        height: 50,
        // padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: RaisedButton(
            color: Colors.blue.withOpacity(0.5),
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
              _controller.checkFuction(context, question);
            }),
      ),
    ),
  );
}

Widget myAudioQuestion(String question, String audio, bool playMp3) {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
  audioCache.play(audio);
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
      Align(
        alignment: Alignment(0.75, -0.2),
        child: IconButton(
          onPressed: () {},
          color: Colors.transparent,
          icon: Icon(
            Icons.replay,
            size: 40,
            color: Colors.blue,
          ),
        ),
      ),
      Align(
        alignment: Alignment(-0.75, -0.2),
        child: IconButton(
          onPressed: () {},
          color: Colors.transparent,
          icon: Icon(
            Icons.play_arrow,
            size: 40,
            color: Colors.blue,
          ),
        ),
      ),
    ],
  );
}
