import 'package:bokly_app/core/utils/app_roter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustemBookDetailsAppBar extends StatelessWidget {
  const CustemBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kHomeView);
          },
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
