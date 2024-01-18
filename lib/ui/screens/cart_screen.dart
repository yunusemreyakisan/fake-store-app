import 'package:fakestoreapp/ui/screens/home_screen.dart';
import 'package:fakestoreapp/utils/extensions.dart';
import 'package:fakestoreapp/view_models/product_viewmodel.dart';
import 'package:fakestoreapp/widgets/cart_product.dart';
import 'package:fakestoreapp/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: productViewModel.cartProducts.isEmpty
            ? Center(
                child: EmptyState(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              )
            : ListView.builder(
                itemCount: productViewModel.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = productViewModel.cartProducts[index];
                  //Returning Cart Product Card
                  return CartProductCard(
                    product: product,
                    onPressed: () {
                      productViewModel.removeProduct(product);
                      showToast("Removed product : ${product.name}");
                    },
                  );
                },
              ),
      ),
    );
  }
}
