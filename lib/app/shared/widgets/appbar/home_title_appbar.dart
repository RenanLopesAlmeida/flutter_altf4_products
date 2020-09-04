import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class HomeTitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 40),
          child: Text(
            'S H O P I N',
            style: TextStyle(
              fontSize: 30,
              color: CustomColors.white,
              fontFamily: 'Raleway-Regular',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.lightGrey,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: CustomColors.darkGrey),
                hintText: 'Search',
                hintStyle: TextStyle(color: CustomColors.darkGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
