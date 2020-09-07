import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/back_appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  static final routeName = '/productDetail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductModel product;

  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isLoading) {
      product = ModalRoute.of(context).settings.arguments as ProductModel;
    }

    _isLoading = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: BackAppbar(product.name)),
      backgroundColor: CustomColors.white,
      body: Container(
        height: _deviceSize.height,
        width: _deviceSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.headerGradient[1],
              CustomColors.headerGradient[0],
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
                child: Hero(
                  tag: 'product ${product.id}',
                  child: Container(
                    width: _deviceSize.width,
                    height: _deviceSize.height * 0.3,
                    color: Colors.white.withOpacity(0.7),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: ListTile(
                  leading: Text(
                    'Quantity',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    product.quantity.toString(),
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: ListTile(
                  leading: Text(
                    'Price',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    'R\$ ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
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
