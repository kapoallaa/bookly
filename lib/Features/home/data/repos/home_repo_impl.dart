import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<Bookmodel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?q=subject:programming&Fitreing=free-ebooks&Sorting=newest');

      List<Bookmodel> books = [];

      for (var item in data['items']) {
        books.add(Bookmodel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<Bookmodel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
