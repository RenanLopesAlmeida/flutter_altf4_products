import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/product_detail/product_detail_screen.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class CardAppbar extends StatelessWidget {
  final ProductsController productsController;

  const CardAppbar({this.productsController});

  Future<void> _handleBestSeller(BuildContext context) async {
    final product = await productsController.bestSeller;
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.all(10),
      width: _deviceSize.width * 0.86,
      height: _deviceSize.height * 0.2,
      decoration: BoxDecoration(
        color: CustomColors.whiteCard.withOpacity(1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: FutureBuilder<ProductModel>(
                future: productsController.bestSeller,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      child: Image.network(
                        snapshot.data.imageUrl,
                        fit: BoxFit.contain,
                      ),
                      onTap: () {
                        _handleBestSeller(context);
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 5, right: 4),
                  child: const Text(
                    'Best seller',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 5, right: 4),
                  child: RaisedButton(
                    elevation: 10,
                    color: CustomColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'SEE',
                      style: TextStyle(
                        color: CustomColors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      _handleBestSeller(context);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
