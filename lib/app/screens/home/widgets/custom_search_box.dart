import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  final Function handleSearch;
  final Widget child;

  CustomSearchBox({@required this.handleSearch, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.headerGradient[0].withOpacity(0.85),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Center(child: child),
    );
  }
}
