import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jalas_project/Screens/signup.dart';
import 'package:jalas_project/Screens/welcomePage.dart';
import 'package:jalas_project/styles/app_colors.dart';
import 'package:jalas_project/styles/text_styles.dart';
import 'package:spring_button/spring_button.dart';

import '../Screens/signin.dart';

class AuthButton extends StatefulWidget {

  final Function() onTap;
  final String text;

  const AuthButton({Key? key, required this.onTap, required this.text })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthButtonState(text);
}

class _AuthButtonState extends State<AuthButton>{
  String textAux;

  _AuthButtonState(this.textAux);

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
  switchMethod(String textoProveniente){
    switch(textoProveniente) {
      case "Soy Parte": {
        Navigator.push(context,  MaterialPageRoute(builder: (context) => const Signin()));
      }
      break;

      case "Soy Nuevo": {
        Navigator.push(context,  MaterialPageRoute(builder: (context) => const SignUp()));
      }
      break;
      default: {
        //statements;
      }
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
   return SpringButton(
     SpringButtonType.WithOpacity,
     row(
       textAux,
       Colors.black38,
     ),
     scaleCoefficient: 0.75,
     duration: 1000,
     useCache: true,
     onTap: () => {
     switchMethod(textAux)
     },
   );
  }
}
