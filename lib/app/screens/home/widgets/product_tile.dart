import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/home/widgets/product_header_card.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 10,
        color: CustomColors.whiteCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ProductHeaderCard(product),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      color: CustomColors.cardTitle,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 80,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.floatingBoxColor,
                ),
                child: Center(
                  child: Text(
                    'Stock: ${product.quantity}',
                    style: TextStyle(color: CustomColors.floatingBoxTitleColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'R\$ ${product.price}',
                  style: TextStyle(
                    color: CustomColors.cardMoneyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
