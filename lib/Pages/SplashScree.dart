import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:quiz/Pages/QuestionPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                "images/logo.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "مسابقة رواد الاغنية المغربية",
                    style: TextStyle(
                        fontFamily: ArabicFonts.Lalezar,
                        color: Colors.white,
                        fontSize: 40),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () => Get.to(QuestionPage()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  child: Text(
                    "دخول المسابقة",
                    style: TextStyle(
                        fontFamily: ArabicFonts.Amiri,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
