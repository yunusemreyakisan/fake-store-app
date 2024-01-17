import 'dart:developer';

import 'package:fakestoreapp/view_models/user_view_model.dart';
import 'package:fakestoreapp/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch product data when the state object is inserted into the tree.
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: productViewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : productViewModel.errorMessage.isNotEmpty
              ? Center(
                  child: Text(productViewModel.errorMessage),
                )
              : ListView.builder(
                  itemCount: productViewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = productViewModel.products[index];

                    // Display a list of users with their name, email, and ID.
                    return ProductCard(
                      imageUrl: product.images![0],
                      title: product.title!,
                      description: product.description!,
                      onPressed: () {
                        log(index.toString());
                      },
                    );
                  },
                ),
    );
  }
}
