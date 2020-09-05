import 'package:altf4_produtos/app/core/consts/app_assets_const.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/widgets/custom_form.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static final String routeName = '/editProduct';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  bool _isLoading = true;
  ProductModel editedProduct;

  var _initValues = {
    'name': '',
    'price': '',
    'quantity': '',
    'imageUrl': '',
  };

  @override
  void didChangeDependencies() {
    if (_isLoading) {
      editedProduct = ModalRoute.of(context).settings.arguments as ProductModel;

      if (editedProduct != null) {
        _initValues = {
          'name': editedProduct.name,
          'price': editedProduct.price.toString(),
          'quantity': editedProduct.quantity.toString(),
          'image_url': editedProduct.imageUrl,
        };
      }
    }
    _isLoading = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColors.headerGradient[1],
        title: Text(
          (editedProduct != null) ? 'Edit Product' : 'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: CircleAvatar(
                backgroundColor: Color(0xffF5810B),
                child: Icon(Icons.add, color: CustomColors.lightGrey)),
            onPressed: () {},
          ),
        ],
      ),
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
            children: <Widget>[
              Opacity(
                opacity: 0.8,
                child: Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.asset(
                      AppAssetsConsts.edit_product_image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: CustomForm(
                  deviceSize: _deviceSize,
                  editedProduct: editedProduct,
                  initValues: _initValues,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
