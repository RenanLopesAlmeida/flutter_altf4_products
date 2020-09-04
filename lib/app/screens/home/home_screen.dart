import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bodyColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppbar(),
            Expanded(
              child: FutureBuilder<List<ProductModel>>(
                future: _productsController.productsList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          width: 200,
                          color: Colors.deepOrangeAccent,
                          child: Center(
                            child: Text(snapshot.data[index].name),
                          ),
                        );
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
