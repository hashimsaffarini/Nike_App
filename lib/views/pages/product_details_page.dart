import 'package:flutter/material.dart';
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body:  Center(
        child: Text('Product Details Page'),
      ),
    );
  
  }
}