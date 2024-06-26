import 'package:bokly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bokly_app/Features/home/domain/entitys/book_entity.dart';
import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newst&q=programming');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kNewestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
