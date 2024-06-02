import 'package:bokly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bokly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bokly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bokly_app/Features/home/domain/entitys/book_entity.dart';
import 'package:bokly_app/Features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:bokly_app/Features/home/domain/use_cases/fetch_news_books.dart';
import 'package:bokly_app/Features/home/presentation/manger/featured_books.cupit/featured_books_cubit.dart';
import 'package:bokly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/core/utils/app_roter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBooks);

  runApp(const Bookly());
}

final getIt = GetIt.instance;

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  ApiService(
                    Dio(),
                  ),
                ),
              )),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  ApiService(
                    Dio(),
                  ),
                ),
              )),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
