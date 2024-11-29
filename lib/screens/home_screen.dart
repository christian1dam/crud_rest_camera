import 'package:crud_rest_camara/screens/screens.dart';
import 'package:crud_rest_camara/services/products_service.dart';
import 'package:crud_rest_camara/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_rest_camara/models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => ProductoCard(
          productsService: productsService,
          product: productsService.products[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productsService.selectedProduct = Product(
            available: false,
            price: 0,
            name: '',
          );
          Navigator.pushNamed(context, 'productScreen');
        },
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
