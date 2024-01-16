import 'package:fakestoreapp/view_models/user_view_model.dart';
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
        title: const Text('Products'),
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
                    return ProductCard(product.images![0]);
                  }),
    );
  }
}

//TODO: Card yaz olmazsa farklı bir API bul.
Widget ProductCard(String? productImage) {
  return Card(
    clipBehavior: Clip.hardEdge,
    color: Colors.black26,
    child: Center(
      child: Image.network(productImage!),
    ),
  );
}
