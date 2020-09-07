import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/search_product/search_product_screen.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomeTitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 40),
            child: const Text(
              'O L X',
              style: TextStyle(
                fontSize: 30,
                color: CustomColors.white,
                fontFamily: 'Raleway-Regular',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        CustomIconButton(
          handleCallback: () {
            Navigator.pushNamed(context, SearchProductScreen.routeName);
          },
        )
      ],
    );
  }
}
