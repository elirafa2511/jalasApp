import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jalas_project/Screens/signin.dart';
import 'package:jalas_project/Screens/signup.dart';
import 'package:jalas_project/Widgets/custom_button.dart';
import 'package:jalas_project/styles/app_colors.dart';
import 'package:jalas_project/styles/text_styles.dart';
import 'package:spring_button/spring_button.dart';
import '../Widgets/CustomHeaderPagInicial.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super (key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{

  Timer? timer;
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right:50),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget> [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.blue,
            ),
            const CustomHeaderPagInicial(
                text: '¡HOLA\nAMIG@S!',
                ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.whiteshade,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      const SizedBox(
                        height: 80,
                      ),
                      const Text("BIENVENID@\nA JALAS?", style: KTextStyle.headerTextStyleBlack,textAlign: TextAlign.center,),
                      const SizedBox(
                        height: 70,
                      ),
                      AuthButton(
                          onTap: () {},
                          text: "Soy Parte"
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AuthButton(
                          onTap: () {},
                          text: "Soy Nuevo"
                      )
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}