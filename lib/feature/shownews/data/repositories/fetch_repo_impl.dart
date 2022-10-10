
import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failure_successes/exceptions.dart';
import 'package:newsapp/core/failure_successes/failures.dart';
import 'package:newsapp/feature/shownews/data/data_sources/fetch_from_remote_ds.dart';
import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';
import 'package:newsapp/feature/shownews/domain/repositories/fetch_repo_contract.dart';

import '../../../../core/service_locator.dart';

class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDs fetchFromRemoteDs = sl<FetchFromRemoteDs>();
  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async  {
    try {
      return Right( await fetchFromRemoteDs.fetchnews(searchText));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

}