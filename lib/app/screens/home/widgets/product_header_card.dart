import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductHeaderCard extends StatelessWidget {
  final ProductModel product;

  ProductHeaderCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColors.darkGrey.withOpacity(0.3),
              borderRadius: const BorderRadius.vertical(
                top: const Radius.circular(20),
              ),
            ),
            child: Image.network(product.imageUrl, fit: BoxFit.contain),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(5),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: CustomColors.favoriteBorderColor,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
