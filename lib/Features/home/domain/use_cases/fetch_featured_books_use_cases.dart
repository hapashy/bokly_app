import 'package:bokly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bokly_app/core/errors/failure.dart';
import 'package:bokly_app/core/errors/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import '../entitys/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}
