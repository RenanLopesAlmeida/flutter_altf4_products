import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Size deviceSize;
  final Widget child;

  const CustomFormField({this.child, this.deviceSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: deviceSize.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.only(left: 20, bottom: 5),
      decoration: BoxDecoration(
        color: CustomColors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: child),
    );
  }
}