import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final value;

  ProductInfo({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 40),
              child: Text(
                title,
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40),
            child: Text(
              value.toString(),
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
