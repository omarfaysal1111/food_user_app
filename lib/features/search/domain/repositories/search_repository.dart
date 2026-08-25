import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/search/domain/entities/search_result.dart';

import 'package:food_user_app/features/search/domain/entities/search_log.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResult>> search(String query);
  Future<Either<Failure, List<SearchLog>>> getSearchHistory();
  Future<Either<Failure, SearchLog>> addSearchLog(String term);
  Future<Either<Failure, void>> deleteSearchLog(int id);
  Future<Either<Failure, void>> clearSearchLogs();
}
