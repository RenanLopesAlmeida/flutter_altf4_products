import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/products_overview/widgets/product_overview_tile.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/back_appbar.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static final String routeName = '/productsOverview';

  final _productsController = GetIt.instance.get<ProductsController>();

  Future<void> _handleRefresh() async {
    await _productsController.fetchProducts();
  }

  Future<void> _handleDeleteProduct(
      String productId, BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Are you sure ?'),
        content: Text('Do you want to remove this product?'),
        actions: <Widget>[
          FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(ctx).pop(false);
              }),
          FlatButton(
              child: Text('Yes'),
              onPressed: () async {
                await _productsController.deleteProduct(productId);
                Navigator.of(ctx).pop(true);
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: BackAppbar('Manage Products'),
        ),
        backgroundColor: CustomColors.headerGradient[1],
        body: FutureBuilder(
          future: _productsController.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Observer(builder: (_) {
                var productList = _productsController.productsList;

                return LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  animSpeedFactor: 2,
                  color: CustomColors.headerGradient[0],
                  onRefresh: _handleRefresh,
                  child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (_, index) => ProductOverviewTile(
                      product: productList[index],
                      handleDeleteProduct: () {
                        _handleDeleteProduct(productList[index].id, context);
                      },
                    ),
                  ),
                );
              });
            }

            return Center(child: CustomCircularProgress());
          },
        ));
  }
}
