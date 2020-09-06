import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/products_overview/widgets/product_overview_tile.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/back_appbar.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static final String routeName = '/productsOverview';

  final _productsController = ProductsController();

  Future<void> _handleRefresh() async {
    await _productsController.fetchProducts();
  }

  Future<void> _handleDeleteProduct(String productId) async {
    await _productsController.deleteProduct(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: BackAppbar('Manage Products'),
        ),
        backgroundColor: CustomColors.headerGradient[1],
        body: FutureBuilder(
          future: _productsController.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LiquidPullToRefresh(
                showChildOpacityTransition: false,
                animSpeedFactor: 2,
                color: CustomColors.headerGradient[0],
                onRefresh: _handleRefresh,
                child: Observer(builder: (_) {
                  var productList = _productsController.productsList;
                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (_, index) => ProductOverviewTile(
                      product: productList[index],
                      handleDeleteProduct: () {
                        _handleDeleteProduct(productList[index].id);
                      },
                    ),
                  );
                }),
              );
            }

            return Center(child: CustomCircularProgress());
          },
        ));
  }
}
