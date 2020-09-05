import 'package:altf4_produtos/app/core/consts/app_assets_const.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static final String routeName = '/editProduct';

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColors.headerGradient[1],
        title: Text(
          'Add a new Product',
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
                child: CustomForm(_deviceSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
