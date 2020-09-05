import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/edit_product_screen.dart';
import 'package:flutter/material.dart';

class HomeTitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 40),
          child: const Text(
            'S H O P',
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
              color: CustomColors.lightGrey.withOpacity(0.9),
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, EditProductScreen.routeName);
          },
          child: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: CustomColors.lightGrey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: CustomColors.darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
