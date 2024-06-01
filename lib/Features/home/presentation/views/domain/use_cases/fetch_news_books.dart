import 'package:bokly_app/Features/home/presentation/views/domain/repos/home_repo.dart';
import 'package:bokly_app/core/errors/failure.dart';
import 'package:bokly_app/core/errors/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import '../entitys/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
