import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

import '../Screens/signin.dart';

class AuthBut extends StatefulWidget {

  final Function() onTap;
  final String text;

  const AuthBut({Key? key, required this.onTap, required this.text })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthButState(text,onTap);
}

class _AuthButState extends State<AuthBut>{
  String textAux;
  final Function() onTapAux;
  _AuthButState(this.textAux, this.onTapAux);
  ButtonState stat = ButtonState.idle;
  String caso = "idle";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProgressButton(
              maxWidth: 300,
              animationDuration: const Duration(milliseconds: 1000),
              stateWidgets: {
                ButtonState.idle: Text(textAux,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                ButtonState.loading: Text("Cargando",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                ButtonState.fail: Text("Intente de Nuevo",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                ButtonState.success: Text("Bienvenido",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
              },
              stateColors: {
                ButtonState.idle: Colors.grey.shade400,
                ButtonState.loading: Colors.blue.shade300,
                ButtonState.fail: Colors.red.shade300,
                ButtonState.success: Colors.green.shade400,
              },
              onPressed: () async {
                await onPressedCustomButton(caso);
                if(textAux == "Sign In"){
                  caso = "exito";
                  onPressedCustomButton(caso);
                }
              },
              state: stat,
          ),
    ],
    );

  }
  Future<void> onPressedCustomButton(op) async {
    await Future.delayed(const Duration(milliseconds: 850));
    setState(() {
      switch (op) {
        case "idle":
          stat = ButtonState.loading;
          break;
        case "exito":
          stat = ButtonState.success;
          break;
        case "fallo":
          stat = ButtonState.fail;
          break;
      }
    });
  }
}