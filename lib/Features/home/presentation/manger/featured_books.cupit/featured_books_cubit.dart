import 'package:bokly_app/Features/home/domain/entitys/book_entity.dart';
import 'package:bokly_app/Features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeatureBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());

    var result = await featuredBooksUseCase.call(pageNumber);

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
