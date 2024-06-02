import 'package:bokly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bokly_app/Features/home/presentation/views/domain/entitys/book_entity.dart';
import 'package:bokly_app/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeREmoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeREmoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  

  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
   var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newst&q=programming');

    List<BookEntity> books = getBooksList(data);
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
