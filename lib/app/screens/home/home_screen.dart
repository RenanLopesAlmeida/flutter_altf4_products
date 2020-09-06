import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/edit_product_screen.dart';
import 'package:altf4_produtos/app/screens/home/widgets/product_tile.dart';
import 'package:altf4_produtos/app/screens/products_overview/products_overview_screen.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/custom_appbar.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home';
  final _productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.bodyColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditProductScreen.routeName);
        },
        child: Icon(Icons.add),
        tooltip: 'Add a Product',
      ),
      body: Container(
        height: _deviceSize.height,
        width: _deviceSize.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomAppbar(
                productsController: this._productsController,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Products',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RaisedButton(
                      color: CustomColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: CustomColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ProductsOverviewScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  height: 300,
                  color: Colors.deepOrangeAccent.withOpacity(0.1),
                  child: FutureBuilder(
                    future: _productsController.fetchProducts(),
                    builder: (context, snapshot) {
                      var productList = _productsController.productsList;
                      if (snapshot.hasData) {
                        return Container(
                          child: Observer(builder: (_) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return ProductTile(
                                  product: productList[index],
                                );
                              },
                            );
                          }),
                        );
                      }

                      return Center(child: CustomCircularProgress());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
