import 'package:dartz/dartz.dart';
import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';
import 'package:newsapp/feature/shownews/domain/repositories/fetch_repo_contract.dart';

import '../../../../core/failure_successes/failures.dart';
import '../../../../core/service_locator.dart';

class FetchNewsUsecase {
  final FetchRepo fetchRepo = sl<FetchRepo>();
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}