import 'package:bokly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'similar_books_list_view.dart';

class SimilarBooksSiction extends StatelessWidget {
  const SimilarBooksSiction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.style14normal.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
