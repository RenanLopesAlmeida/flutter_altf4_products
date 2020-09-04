import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/card_appbar.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/home_title_appbar.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final ProductsController productsController;

  const CustomAppbar({this.productsController});

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      width: _deviceSize.width,
      height: _deviceSize.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            width: _deviceSize.width,
            height: _deviceSize.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(40),
                bottomRight: const Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.headerGradient[0],
                  CustomColors.headerGradient[1],
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: HomeTitleAppBar(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CardAppbar(productsController: productsController),
          ),
        ],
      ),
    );
  }
}
