import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

Widget circleProgress({double progressValue, String title, String desc}) {
  return Container(
    height: 100,
    child: LiquidCircularProgressIndicator(
      value: progressValue,
      center: Column(
        children: [
          AutoSizeText(title, maxLines: 1),
          AutoSizeText(desc, maxLines: 1),
        ],
      ),
      backgroundColor: Colors.transparent,
      borderWidth: 2,
      borderColor: Colors.white,
    ),
  );
}

Widget normalProgress({double progressValue, String title}) {
  return Container(
    height: 50,
    child: LiquidLinearProgressIndicator(
      value: progressValue,
      center: AutoSizeText(title, maxLines: 1),
      backgroundColor: Colors.transparent,
      borderRadius: 20,
      borderWidth: 2,
      borderColor: Colors.white,
    ),
  );
}
