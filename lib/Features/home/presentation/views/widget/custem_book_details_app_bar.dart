import 'package:flutter/material.dart';

class CustemBookDetailsAppBar extends StatelessWidget {
  const CustemBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_shopping_cart_outlined),
        ),
      ],
    );
  }
}
