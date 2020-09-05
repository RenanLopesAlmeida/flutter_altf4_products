import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class BackAppbar extends StatelessWidget {
  final String title;

  BackAppbar(this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: CustomColors.headerGradient[1],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: CustomColors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
