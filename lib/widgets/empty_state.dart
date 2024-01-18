import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onPressed;
  const EmptyState({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Shopping Cart is empty, start shopping now.",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.bolt),
          ),
        ),
      ],
    );
  }
}
