import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/home/widgets/custom_search_box.dart';
import 'package:altf4_produtos/app/shared/widgets/appbar/back_appbar.dart';
import 'package:altf4_produtos/app/shared/widgets/product_tile.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_circular_progress.dart';
import 'package:altf4_produtos/app/shared/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {
  static final String routeName = '/searchProduct';

  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  String searchedProduct;

  final _formKey = GlobalKey<FormState>();
  final _product = ProductsController();
  bool hasError = false;

  Future<void> _handleSearch() async {
    _formKey.currentState.save();
    try {
      _product.setSearchedProduct(searchedProduct);
      await _product.searchProductById();
    } catch (error) {
      hasError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: BackAppbar('Search Product'),
      ),
      body: Container(
        width: _deviceSize.width,
        height: _deviceSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  'Our Products',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomSearchBox(
                        handleSearch: this._handleSearch,
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            style: TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              border: InputBorder.none,
                              hintText: 'Search a product by ID',
                              hintStyle: TextStyle(
                                height: 0.3,
                                color: CustomColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: CustomColors.bodyColor,
                              ),
                            ),
                            onSaved: (newValue) {
                              setState(() {
                                searchedProduct = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    CustomIconButton(
                      handleCallback: this._handleSearch,
                      containerSize: Size(65, 65),
                      paperRadius: false,
                    ),
                  ],
                ),
              ),
              (searchedProduct != null && searchedProduct.isNotEmpty)
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: FutureBuilder<ProductModel>(
                          future: _product.searchProductById(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ProductTile(
                                product: snapshot.data,
                                containerSize: Size(_deviceSize.width, 300),
                              );
                            }

                            return Center(
                              child: (!hasError)
                                  ? CustomCircularProgress()
                                  : Text(
                                      'Please insert a valid product Id',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
