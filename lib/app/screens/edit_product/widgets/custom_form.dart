import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/widgets/custom_formfield.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/utils/validators/product_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomForm extends StatefulWidget {
  final Size deviceSize;
  final ProductModel editedProduct;
  final Map<String, dynamic> initValues;

  CustomForm({this.deviceSize, this.editedProduct, this.initValues});

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();
  final _productsController = GetIt.instance.get<ProductsController>();
  final ProductModel _product = ProductModel();

  FocusNode _nameFocusNode;
  FocusNode _priceFocusNode;
  FocusNode _quantityFocusNode;
  FocusNode _imageFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _priceFocusNode = FocusNode();
    _quantityFocusNode = FocusNode();
    _imageFocusNode = FocusNode();
    super.initState();
  }

  @override
  dispose() {
    _nameFocusNode.dispose();
    _priceFocusNode.dispose();
    _quantityFocusNode.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState.save();

    try {
      ProductModel product = ProductModel.fromJson(_formData);

      if (widget.editedProduct == null) {
        await _productsController.addProduct(product);
      } else {
        product.id = widget.editedProduct.id;
        await _productsController.updateProduct(product);
      }

      Navigator.of(context).pop();
    } catch (error) {
      print('$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _nameFocusNode,
              textInputAction: TextInputAction.next,
              initialValue: widget.initValues['name'],
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  height: 0,
                ),
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              validator: ProductValidator.nameValidator,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (value) {
                _formData['name'] = value;
                _product.setName(value);
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              initialValue: widget.initValues['price'],
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(
                  height: 0,
                ),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'R\$',
                    style: TextStyle(
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_quantityFocusNode);
              },
              validator: (value) {
                return ProductValidator.numberValidator(value, 'Price');
              },
              onSaved: (value) {
                _formData['price'] = double.parse(value);
                _product.setPrice(double.parse(value));
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _quantityFocusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              initialValue: widget.initValues['quantity'],
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(height: 0),
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_imageFocusNode);
              },
              validator: (value) {
                return ProductValidator.numberValidator(value, 'quantity');
              },
              onSaved: (value) {
                _formData['quantity'] = int.parse(value);
                _product.setQuantity(int.parse(value));
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _imageFocusNode,
              initialValue: widget.initValues['image_url'],
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Image URL',
                labelStyle: TextStyle(
                  height: 0,
                ),
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              validator: ProductValidator.imageURLValidator,
              onSaved: (value) {
                _formData['image_url'] = value;
                _product.setImageUrl(value);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 50,
            child: RaisedButton(
              child: Text(
                widget.editedProduct != null ? 'Edit Product' : 'Add Product',
                style: TextStyle(
                  color: CustomColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              color: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: _handleSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
