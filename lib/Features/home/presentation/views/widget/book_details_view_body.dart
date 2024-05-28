import 'package:bokly_app/Features/home/presentation/views/widget/book_rating.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/books_action.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/custem_book_details_app_bar.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/custom_book_item.dart';
import 'package:bokly_app/core/utils/styles.dart';
import 'package:bokly_app/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const CustemBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: const CustomBookImage(),
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              'The Jungle Book',
              style: Styles.style30normal.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: .7,
              child: Text(
                'Rudyard Kipling',
                style: Styles.style18W600.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 37,
            ),
            const BooksAction(),
          ],
        ),
      ),
    );
  }
}
