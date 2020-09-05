import 'package:altf4_produtos/app/controllers/products/products_controller.dart';
import 'package:altf4_produtos/app/core/consts/app_colors_const.dart';
import 'package:altf4_produtos/app/screens/edit_product/edit_product_screen.dart';
import 'package:altf4_produtos/app/screens/home/home_screen.dart';
import 'package:altf4_produtos/app/screens/product_detail/product_detail_screen.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        accentColor: CustomColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditProductScreen.routeName: (context) => EditProductScreen(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
      home: FutureBuilder<List<ProductModel>>(
        future: _productsController.productsList,
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            Center(child: Text('Could not fetch products'));
          }
          if (snapshot.hasData) {
            return HomeScreen();
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
