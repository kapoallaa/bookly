import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Bookmodel>>> fetchNewsetBooks();
  Future<Either<Failures, List<Bookmodel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<Bookmodel>>> fetchSimilarBooks(
      {required String category});
}
