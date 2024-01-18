import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ProductCard extends StatelessWidget {
  final String title, description, price;
  final double rating;
  final VoidCallback onPressed;

  const ProductCard(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    ReadMoreText(
                      description,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read More',
                      style: const TextStyle(fontSize: 13),
                      trimExpandedText: ' Less',
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                RatingBarIndicator(
                  rating: rating,
                  itemCount: 5,
                  itemSize: 15.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
