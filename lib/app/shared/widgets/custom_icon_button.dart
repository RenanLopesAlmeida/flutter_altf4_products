import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function handleCallback;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;
  final Size containerSize;
  final bool paperRadius;

  CustomIconButton({
    @required this.handleCallback,
    this.iconColor = CustomColors.darkGrey,
    this.icon = Icons.search,
    this.containerSize = const Size(50, 50),
    this.containerColor = CustomColors.lightGrey,
    this.paperRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleCallback,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: containerSize.width,
        width: containerSize.height,
        decoration: BoxDecoration(
          color: containerColor.withOpacity(0.9),
          borderRadius: (paperRadius)
              ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                )
              : BorderRadius.circular(20),
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
