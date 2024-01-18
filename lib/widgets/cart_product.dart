import 'dart:math';
import 'package:fakestoreapp/data/models/product.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const CartProductCard({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Colored Product Image
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Container(
                  height: MediaQuery.sizeOf(context).height / 10,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)])),

          // Title & Description
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    product.description!,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          ),

          // Remove Item
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
