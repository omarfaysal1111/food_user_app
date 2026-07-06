import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/search/domain/entities/search_result.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResult>> search(String query);

  Future<Either<Failure, List<String>>> getSearchHistory();
}
