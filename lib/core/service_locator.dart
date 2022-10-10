import 'package:get_it/get_it.dart';
import 'package:newsapp/core/services/api_service.dart';
import 'package:newsapp/feature/shownews/data/data_sources/fetch_from_remote_ds.dart';
import 'package:newsapp/feature/shownews/data/repositories/fetch_repo_impl.dart';
import 'package:newsapp/feature/shownews/domain/usecases/fetch_news.dart';

import '../feature/shownews/domain/repositories/fetch_repo_contract.dart';

final GetIt sl = GetIt.instance;
void setUpServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDs>(FetchFromRemoteDsImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  sl.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}
