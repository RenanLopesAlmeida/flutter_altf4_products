import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CardAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 80),
      width: _deviceSize.width * 0.86,
      height: _deviceSize.height * 0.18,
      decoration: BoxDecoration(
        color: CustomColors.whiteCard.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
