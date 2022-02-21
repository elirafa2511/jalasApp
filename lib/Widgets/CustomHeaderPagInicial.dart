import 'package:flutter/material.dart';
import 'package:jalas_project/styles/text_styles.dart';

class CustomHeaderPagInicial extends StatelessWidget {
  final String text;
  const CustomHeaderPagInicial({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Text(
                  text,
                  style: KTextStyle.headerTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}