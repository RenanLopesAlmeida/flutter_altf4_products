import 'package:altf4_produtos/app/screens/edit_product/edit_product_screen.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductOverviewTile extends StatelessWidget {
  final ProductModel product;

  ProductOverviewTile(this.product);

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      height: 80,
      width: _deviceSize.width,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: ListTile(
              leading: CircleAvatar(
                child: Image.network(product.imageUrl, fit: BoxFit.contain),
              ),
              title: Text(product.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        EditProductScreen.routeName,
                        arguments: product,
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
