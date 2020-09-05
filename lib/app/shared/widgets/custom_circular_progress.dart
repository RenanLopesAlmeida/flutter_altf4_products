import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
      backgroundColor: CustomColors.white,
    );
  }
}
