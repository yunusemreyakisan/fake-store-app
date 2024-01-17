import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl, title, description;
  final VoidCallback onPressed;

  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Image.network(imageUrl),
          ),

          // Title & Description
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(description, maxLines: 4),
                ],
              ),
            ),
          ),

          //Icon
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
