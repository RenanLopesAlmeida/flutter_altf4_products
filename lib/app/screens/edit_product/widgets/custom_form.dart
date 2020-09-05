import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/widgets/custom_formfield.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:altf4_produtos/app/shared/utils/validators/product_validator.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Size deviceSize;

  CustomForm(this.deviceSize);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();
  final _productsController = ProductsController();

  final _nameFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();

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
      print(product.name);
      await _productsController.addProduct(product);
    } catch (error) {
      print('ERROR when tried to add a new product. ERROR: $error');
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
              decoration: InputDecoration(
                hintText: 'Name',
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.1,
                ),
              ),
              validator: (value) {
                return ProductValidator.nameValidator(value);
              },
              onSaved: (value) {
                _formData['name'] = value;
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Price',
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.1,
                ),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              validator: (value) {
                return ProductValidator.numberValidator(value, 'Price');
              },
              onSaved: (value) {
                _formData['price'] = double.parse(value);
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              focusNode: _quantityFocusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Quantity',
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.1,
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
              },
            ),
          ),
          CustomFormField(
            deviceSize: widget.deviceSize,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Image URL',
                border: InputBorder.none,
                errorStyle: TextStyle(
                  height: 0.1,
                ),
              ),
              validator: (value) {
                return ProductValidator.imageURLValidator(value);
              },
              onSaved: (value) {
                _formData['image_url'] = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 50,
            child: RaisedButton(
              child: Text(
                'Add Product',
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
