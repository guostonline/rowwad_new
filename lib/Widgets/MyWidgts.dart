import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

Widget myProgressBar(double value, int question, int stage) {
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

Widget myButtonRaisen(String text, int question) {
  return Container(
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
          minFontSize: 15,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => print(text)),
  );
}
