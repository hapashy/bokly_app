import 'package:bokly_app/Features/home/presentation/manger/featured_books.cupit/featured_books_cubit.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBulider extends StatelessWidget {
  const FeaturedBooksListViewBlocBulider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return  FeaturedBooksListView(
          books: state.books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errMassage);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
