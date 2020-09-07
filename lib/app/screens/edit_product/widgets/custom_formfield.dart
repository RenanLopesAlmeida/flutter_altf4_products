import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Size deviceSize;
  final Widget child;

  const CustomFormField({this.child, this.deviceSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: deviceSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.only(left: 20, right: 15),
      decoration: BoxDecoration(
        color: CustomColors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
