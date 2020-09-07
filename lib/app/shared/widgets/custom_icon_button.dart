import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function handleCallback;
  final IconData icon;
  final Color iconColor;
  final Size containerSize;

  CustomIconButton({
    @required this.handleCallback,
    this.iconColor = CustomColors.darkGrey,
    this.icon = Icons.search,
    this.containerSize = const Size(50, 50),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleCallback,
      child: Container(
        height: containerSize.width,
        width: containerSize.height,
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: CustomColors.lightGrey.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
