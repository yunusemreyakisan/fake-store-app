import 'package:fakestoreapp/ui/screens/cart_screen.dart';
import 'package:fakestoreapp/ui/screens/product_detail_screen.dart';
import 'package:fakestoreapp/view_models/product_viewmodel.dart';
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
    return Consumer<ProductViewModel>(
      builder: (context, productViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              'Products',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.shopping_basket),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
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

                        // Display a list of products with their name, email, and ID.
                        return ProductCard(
                          title: product.name!,
                          description: product.description!,
                          price: '₺ ${product.price!}',
                          rating: product.rating!,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: product,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
        );
      },
    );
  }
}
