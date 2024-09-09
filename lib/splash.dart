import 'dart:async';

import 'package:bmi_calculator/firstpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>firstPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: Text("Calculate Your BMI",
          style: TextStyle(
              fontSize: 40,color: Colors.grey,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}