import 'package:bokly_app/Features/home/domain/entitys/book_entity.dart';
import 'package:bokly_app/Features/home/presentation/manger/featured_books.cupit/featured_books_cubit.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/custom_book_image_loading_indicator.dart';
import 'package:bokly_app/Features/home/presentation/views/widget/featured_list_view.dart';
import 'package:bokly_app/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }

      if (state is FeaturedBooksPaginationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(buildErrorWidget(state.errMessage));
      }
    }, builder: (context, state) {

      
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errMassage);
      } else {
        return const CustomBookImageLoadingIndicator();
      }
    });
  }
}
