import 'dart:math';
import 'package:fakestoreapp/data/models/product.dart';
import 'package:fakestoreapp/utils/extensions.dart';
import 'package:fakestoreapp/view_models/product_viewmodel.dart';
import 'package:fakestoreapp/widgets/card_price_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  height: MediaQuery.sizeOf(context).height / 2.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(product.description!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300)),
                    ),
                    RatingBarIndicator(
                      rating: product.rating!,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardPriceContainer(
            productPrice: product.price.toString(),
            onPressed: () {
              productViewModel.addProduct(product);
              showToast("Added product to cart: ${product.name}");
            },
          )
        ],
      ),
    );
  }
}
