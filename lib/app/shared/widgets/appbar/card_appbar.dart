import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class CardAppbar extends StatelessWidget {
  final ProductsController productsController;

  const CardAppbar({this.productsController});

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.all(10),
      width: _deviceSize.width * 0.86,
      height: _deviceSize.height * 0.18,
      decoration: BoxDecoration(
        color: CustomColors.whiteCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              color: CustomColors.greyCard,
              // child: FutureBuilder<ProductModel>(
              //   future: productsController.bestSeller,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       print(snapshot.data.name);
              //       return Text(snapshot.data.name);
              //       // return Image.network(
              //       //   snapshot.data.imageUrl,
              //       //   fit: BoxFit.contain,
              //       // );
              //     }

              //     return CircularProgressIndicator();
              //   },
              // ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: const Text('Best seller'),
          ),
        ],
      ),
    );
  }
}
