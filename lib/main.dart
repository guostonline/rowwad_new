import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Pages/QuestionPage.dart';
import 'package:quiz/Pages/SplashScree.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuestionPage(),
  ));
}
