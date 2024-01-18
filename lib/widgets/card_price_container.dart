import 'package:flutter/material.dart';

class CardPriceContainer extends StatelessWidget {
  final String productPrice;
  final VoidCallback onPressed;

  const CardPriceContainer(
      {super.key, required this.productPrice, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '₺ $productPrice',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          //Icon
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            iconSize: 30,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
