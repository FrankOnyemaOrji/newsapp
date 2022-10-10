import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failure_successes/failures.dart';

import '../entitles/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}